class RegistrationsController < ApplicationController
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
      redirect_to registrations_path, :notice => "Tipo de registro agregado."
    else
      flash[:error] = "No se pudo agregar tipo de registro."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @registration.update_attributes(params[:registration])
      redirect_to registrations_path, :notice => "Se ha actualizado el tipo de registro."
    else
      flash[:error] = "No se pudo actualizar el tipo de registro."
      render 'edit'
    end
  end

  def destroy
    @registration.destroy
    redirect_to registrations_path, :notice => "Se ha eliminado el tipo de registro."
  end

  private
    def find_registration
      @registration = Registration.find(params[:id])
    end
end
