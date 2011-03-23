class InterestsController < ApplicationController
  before_filter :find_interest, :only => [:show, :edit, :update, :destroy]

  def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    if @interest.save
      redirect_to interests_path, :notice => "Interes agregado."
    else
      flash[:error] = "No se pudo agregar interes."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @interest.update_attributes(params[:interest])
      redirect_to interests_path, :notice => "Se ha actualizado el interes."
    else
      flash[:error] = "No se pudo actualizar el interes."
      render 'edit'
    end
  end

  def destroy
    @interest.destroy
    redirect_to interests_path, :notice => "Se ha eliminado el interes."
  end

  private
    def find_interest
      @interest = Interest.find(params[:id])
    end
end
