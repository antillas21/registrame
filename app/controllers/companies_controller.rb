class CompaniesController < ApplicationController
  def index
    @companies = Company.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
      format.js
    end
  end

  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "Nueva Empresa agregada"
      redirect_to @company
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      @company.country_id = params[:country_id]
      flash[:notice] = "Empresa modificada exitosamente"
      redirect_to company_path
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Empresa eliminada exitosamente"
    redirect_to companies_path
  end

end
