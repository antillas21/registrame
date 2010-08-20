class SectorsController < ApplicationController
  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
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

end
