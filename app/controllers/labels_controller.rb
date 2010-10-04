class LabelsController < ApplicationController
  before_filter :title, :except => [:destroy]
  cache_sweeper :label_sweeper, :only => [:create, :update, :destroy]
  
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end
  
  def create
    @label = Label.new(params[:label])
    if @label.save
      flash[:notice] = "Nueva Etiqueta agregada"
      redirect_to @label
    else
      render 'new'
    end
  end

  def edit
    @label = Label.find(params[:id])
  end
  
  def show
    @label = Label.find(params[:id])
  end
  
  def update
    @label = Label.find(params[:id])
    if @label.update_attributes(params[:label])
      flash[:notice] = "Etiqueta modificada exitosamente"
      redirect_to @label
    else
      render 'edit'
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    flash[:notice] = "Etiqueta eliminado exitosamente"
    redirect_to labels_path
  end
  
  def title
    @title = "Gafete"
  end

end
