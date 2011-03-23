class StatesController < ApplicationController
  def new
    @state = State.new
  end

  def create
    #@state = State.new(params[:state])
    #@state.save
    @state = State.create!(params[:state])
  end

  def index
    @states = State.all
    respond_to do |format|
      format.xml { render :xml => @states }
    end
  end

end

