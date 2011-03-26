class PromotionsController < ApplicationController
  before_filter :find_promotion, :only => [:show, :edit, :update, :destroy]

  def index
    @promotions = Promotion.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @promotions, :root => :promotions }
      format.json { render_for_api :complete_record, :json => @promotions, :root => :promotions }
    end
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(params[:promotion])
    if @promotion.save
      redirect_to promotions_path, :notice => "Medio de promocion agregado."
    else
      flash[:error] = "No se pudo agregar medio de promocion."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @promotion.update_attributes(params[:promotion])
      redirect_to promotions_path, :notice => "Se ha actualizado el medio de promocion."
    else
      flash[:error] = "No se pudo actualizar el medio de promocion."
      render 'edit'
    end
  end

  def destroy
    @promotion.destroy
    redirect_to promotions_path, :notice => "Se ha eliminado el medio de promocion."
  end

  private
    def find_promotion
      @promotion = Promotion.find(params[:id])
    end
end
