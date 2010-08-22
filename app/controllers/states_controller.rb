class StatesController < ApplicationController
  
  def index
    @states = State.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
      format.js
    end
  end
  
  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(params[:state])
    if @state.save
      flash[:notice] = "Nuevo estado agregado"
      redirect_to states_path
    else
      render 'new'
    end
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])
    if @state.update_attributes(params[:state])
      flash[:notice] = "Estado modificado exitosamente"
      redirect_to states_path
    else
      render 'edit'
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    flash[:notice] = "Estado eliminado exitosamente"
    redirect_to states_path
  end

end
