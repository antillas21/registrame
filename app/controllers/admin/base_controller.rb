class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  
  def index
    @registrations = Registration.all
    @people = Person.all
    @attendees = Person.attended
  end
end