class NameBadgesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :authorize_admin!, :except => [:index]
  before_filter :find_name_badge, :only => [:show, :edit, :update]

  def show

  end

  def edit

  end

  def update

    if @name_badge.update_attributes(params[:name_badge])
      redirect_to name_badges_path, :notice => "Name badge has been updated."
    else
      flash[:alert] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def index
    @name_badges = NameBadge.all
  end

  private
    def find_name_badge
      @name_badge = NameBadge.find(params[:id])
    end
end
