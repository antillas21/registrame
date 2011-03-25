class PeopleController < ApplicationController
  before_filter :find_person, :only => [:show, :edit, :update, :destroy]
  
  def index
    @people = Person.all
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to @person, :notice => 'Nuevo asistente registrado.'
    else
      flash[:error] = 'No se pudo registrar asistente.'
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice => "Se ha actualizado el registro."
    else
      flash[:error] = "No se pudo actualizar el registro."
      render 'edit'
    end
  end
  
  def destroy
    @person.destroy
    redirect_to people_path, :notice => "Se ha eliminado el registro."
  end
  
  private
    def find_person
      @person = Person.find(params[:id])
    end
end
