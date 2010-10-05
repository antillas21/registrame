class PagesController < ApplicationController
  def home
    @title = 'Bienvenido'
    #render :layout => false
  end
  
  def help
    @title = 'Ayuda'
  end
  
end
