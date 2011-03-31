class RegistrationsController < ApplicationController
  before_filter :authorize_admin!
  before_filter :find_registration, :only => [:show, :edit, :update, :destroy]

  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      redirect_to registrations_path, :notice => "Added new registration type."
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
    if @registration.update_attributes(params[:registration])
      redirect_to registrations_path, :notice => "Registration type has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @registration.destroy
    redirect_to registrations_path, :notice => "Registration type has been deleted."
  end

  private
    def find_registration
      @registration = Registration.find(params[:id])
    end
end
