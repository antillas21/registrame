class ReportsController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @users = User.all
    @registrations = Registration.all
    @interests = Interest.all
    @promos = Promo.all
  end
  
  def title
    @title = "Reportes"
  end

end
