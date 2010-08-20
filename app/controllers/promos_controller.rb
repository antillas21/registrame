class PromosController < ApplicationController
  def index
    @promos = Promo.all
  end

  def new
    @promo = Promo.new
  end
  
  def create
    @promo = Promo.new(params[:promo])
    if @promo.save
      flash[:notice] = "Nuevo Promocional agregado"
      redirect_to promos_path
    else
      render 'new'
    end
  end

  def edit
    @promo = Promo.find(params[:id])
  end
  
  def show
    @promo = Promo.find(params[:id])
  end
  
  def update
    @promo = Promo.find(params[:id])
    if @promo.update_attributes(params[:promo])
      flash[:notice] = "Promocional modificado exitosamente"
      redirect_to promos_path
    else
      render 'edit'
    end
  end

  def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy
    flash[:notice] = "Promocional eliminado exitosamente"
    redirect_to promos_path
  end

end
