class DepartmentsController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @departments = Department.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
      format.js
    end
  end

  def new
    @department = Department.new
    @title = "Agregar Departamento"
  end
  
  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:notice] = "Nuevo Departamento agregado"
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
    @title = "Editar Departamento"
  end
  
  def show
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = "Departamento modificado exitosamente"
      redirect_to departments_path
    else
      render 'edit'
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "Departamento eliminado exitosamente"
    redirect_to departments_path
  end
  
  def title
    @title = "Departamentos"
  end

end
