class CountriesController < ApplicationController
  def index
    @countries = Country.all
    respond_to do |format|
      format.xml { render :xml => @countries }
    end
  end

  def new
    @country = Country.new
  end

  def create
    #@country = Country.new(params[:country])
    #@country.save
    @country = Country.create!(params[:country])
  end
end

