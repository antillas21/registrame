class CountriesController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @countries = Country.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
      format.js
    end
    @title = "Paises"
  end

  def new
    @country = Country.new
    @title = "Agregar Pais"
  end
  
  def create
    @country = Country.new(params[:country])
    if @country.save
      flash[:notice] = "Nuevo pais agregado"
      redirect_to countries_path
    else
      render 'new'
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def edit
    @country = Country.find(params[:id])
    @title = "Editar Pais"
  end
  
  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(params[:country])
      flash[:notice] = "Pais modificado exitosamente"
      redirect_to countries_path
    else
      render 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    flash[:notice] = "Pais eliminado exitosamente"
    redirect_to countries_path
  end
  
  def title
    @title = "Paises"
  end

end
