class CompaniesController < ApplicationController
  respond_to :html, :json, :xml
  before_filter :find_company, :only => [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    respond_with(@companies)
    #respond_to do |format|
     # format.html
      #format.xml { render :xml => @companies }
      #format.js
    #end
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
    respond_with(@company)
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

