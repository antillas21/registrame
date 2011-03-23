class SectorsController < ApplicationController
  before_filter :find_sector, :only => [:show, :edit, :update, :destroy]

  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(params[:sector])
    if @sector.save
      redirect_to sectors_path, :notice => "Sector agregado."
    else
      flash[:error] = "No se pudo agregar sector."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @sector.update_attributes(params[:sector])
      redirect_to sectors_path, :notice => "Se ha actualizado el sector."
    else
      flash[:error] = "No se pudo actualizar el sector."
      render 'edit'
    end
  end

  def destroy
    @sector.destroy
    redirect_to sectors_path, :notice => "Se ha eliminado el sector."
  end

  private
    def find_sector
      @sector = Sector.find(params[:id])
    end
end
