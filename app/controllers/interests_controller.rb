class InterestsController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end
  
  def create
    @interest = Interest.new(params[:interest])
    if @interest.save
      flash[:notice] = "Nuevo Interés agregado"
      redirect_to interests_path
    else
      render 'new'
    end
  end

  def edit
    @interest = Interest.find(params[:id])
  end
  
  def show
    @interest = Interest.find(params[:id])
  end
  
  def update
    @interest = Interest.find(params[:id])
    if @interest.update_attributes(params[:interest])
      flash[:notice] = "Interés modificado exitosamente"
      redirect_to interests_path
    else
      render 'edit'
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    flash[:notice] = "Interés eliminado exitosamente"
    redirect_to interests_path
  end
  
  def title
    @title = "Intereses"
  end

end
