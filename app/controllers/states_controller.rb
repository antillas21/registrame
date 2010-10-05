class StatesController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def table
      @states = State.all
      @total = State.count
      respond_to do |format|
        format.html
        format.json
      end
  end
  
  def sample
    @myvar = "States"
    render :file => 'app/views/states/sample.html.erb'
  end
  
  
  def index
    @states = State.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
      format.js
      format.json { render :json => @states }
    end
  end
  
  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
    @title = "Agregar Estado"
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
    @title = "Editar Estado"
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
  
  def title
    @title = "Estados"
  end

end
