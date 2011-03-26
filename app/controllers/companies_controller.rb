class CompaniesController < ApplicationController
  before_filter :find_company, :only => [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :name_only, :xml => @companies, :root => :companies }
      format.json { render_for_api :name_only, :json => @companies, :root => :companies }
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => "Empresa agregada."
    else
      flash[:error] = "No se pudo agregar empresa."
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render_for_api :name_only, :xml => @company }
      format.json { render_for_api :name_only, :json => @company }
    end
  end

  def edit

  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => "Se ha actualizado la empresa."
    else
      flash[:error] = "No se pudo actualizar la empresa."
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, :notice => "Se ha eliminado la empresa."
  end

  private
    def find_company
      @company = Company.find(params[:id])
    end
end

