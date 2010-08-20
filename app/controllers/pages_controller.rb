class PagesController < ApplicationController
  def home
  end

  def guide
    @message = 'Guia de Configuracion'
  end

end
