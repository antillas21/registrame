class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end
  
  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      flash[:notice] = "Nuevo Tipo de Registro agregado"
      redirect_to registrations_path
    else
      render 'new'
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end
  
  def show
    @registration = Registration.find(params[:id])
  end
  
  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      flash[:notice] = "Tipo de Registro modificado exitosamente"
      redirect_to registrations_path
    else
      render 'edit'
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    flash[:notice] = "Tipo de Registro eliminado exitosamente"
    redirect_to registrations_path
  end

end