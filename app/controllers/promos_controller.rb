class PromosController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @promos = Promo.all
  end

  def new
    @promo = Promo.new
    @title = "Agregar Medio de Promocion"
  end
  
  def create
    @promo = Promo.new(params[:promo])
    if @promo.save
      flash[:notice] = "Nuevo Medio de Promoci&oacute;n agregado"
      redirect_to promos_path
    else
      render 'new'
    end
  end

  def edit
    @promo = Promo.find(params[:id])
    @title = "Editar Medio de Promocion"
  end
  
  def show
    @promo = Promo.find(params[:id])
  end
  
  def update
    @promo = Promo.find(params[:id])
    if @promo.update_attributes(params[:promo])
      flash[:notice] = "Medio de Promoci&oacute;n modificado exitosamente"
      redirect_to promos_path
    else
      render 'edit'
    end
  end

  def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy
    flash[:notice] = "Medio de Promoci&oacute;n eliminado exitosamente"
    redirect_to promos_path
  end
  
  def title
    @title = "Medios de Promocion"
  end

end
