class NameBadgesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :authorize_admin!, :except => [:index]
  
  def show
    @name_badge = NameBadge.find(params[:id])
  end

  def edit
    @name_badge = NameBadge.find(params[:id])
  end

  def update
    @name_badge = NameBadge.find(params[:id])
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
end
