class UsersController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  if Label.count > 0
    @@label = Label.first
    prawnto :prawn => {
                :page_layout => :portrait,
                :left_margin => (@@label.left),
                :right_margin => (@@label.right),
                :top_margin => (@@label.top),
                :bottom_margin => (@@label.bottom),
                :page_size => [(@@label.width), (@@label.height)]
                }  
  end
  
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
    @title = "Registros"
  end

  def new
    @user = User.new
    @title = "Agregar Registro"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Nuevo Registro agregado"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Editar Registro"
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf { printed }
    end
    @title = "Registro"
  end
  
  def printed
    @user.printed = true
    @user.save
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Registro modificado exitosamente"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Registro eliminado exitosamente"
    redirect_to users_path
  end
  
  def title
    @title = "Registros"
  end

end
