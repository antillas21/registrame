class InterestsController < ApplicationController
  before_filter :authorize_admin!
  before_filter :find_interest, :only => [:show, :edit, :update, :destroy]

  def index
    @interests = Interest.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @interests, :root => :interests }
      format.json { render_for_api :complete_record, :json => @interests, :root => :interests }
    end
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    if @interest.save
      redirect_to interests_path, :notice => "Added new interest."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @interest.update_attributes(params[:interest])
      redirect_to interests_path, :notice => "Interest has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @interest.destroy
    redirect_to interests_path, :notice => "Interest has been deleted."
  end

  private
    def find_interest
      @interest = Interest.find(params[:id])
    end
end
