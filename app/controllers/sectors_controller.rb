class SectorsController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :authorize_admin!
  before_filter :find_sector, :only => [:show, :edit, :update, :destroy]

  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(params[:sector])
    if @sector.save
      redirect_to sectors_path, :notice => "Added new sector."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @sector.update_attributes(params[:sector])
      redirect_to sectors_path, :notice => "Sector has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @sector.destroy
    redirect_to sectors_path, :notice => "Sector has been deleted."
  end

  private
    def find_sector
      @sector = Sector.find(params[:id])
    end
end
