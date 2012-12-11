class SectorsController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @sectors = Sector.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sectors }
      format.js
    end
  end

  def new
    @sector = Sector.new
    @title = "Agregar Sector"
  end
  
  def create
    @sector = Sector.new(params[:sector])
    if @sector.save
      flash[:notice] = "Nuevo Sector agregado"
      redirect_to sectors_path
    else
      render 'new'
    end
  end

  def edit
    @sector = Sector.find(params[:id])
    @title = "Editar Sector"
  end
  
  def show
    @sector = Sector.find(params[:id])
  end
  
  def update
    @sector = Sector.find(params[:id])
    if @sector.update_attributes(params[:sector])
      flash[:notice] = "Sector modificado exitosamente"
      redirect_to sectors_path
    else
      render 'edit'
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    flash[:notice] = "Sector eliminado exitosamente"
    redirect_to sectors_path
  end
  
  def title
    @title = "Sectores"
  end

end