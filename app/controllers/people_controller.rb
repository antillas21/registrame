class PeopleController < ApplicationController
  before_filter :find_person, :only => [:show, :edit, :update, :destroy]

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      session[:person_id] = @person.id
      if @person.company
        redirect_to edit_company_path(@person.company), :notice => 'We have created your record, now please tell us a little about your company.'
      else
        redirect_to @person, :notice => "Thank you. <strong>This step completes your registration</strong>".html_safe
      end
      PersonMailer.registration_confirmation(@person).deliver
    else
      flash[:error] = 'There were some errors. Please correct them before proceeding.'
      render 'new'
    end
  end

  def edit

  end

  def show
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @person }
      format.json { render_for_api :complete_record, :json => @person }
      format.pdf { printed }
    end
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice => "Thank you for updating your record."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, :notice => "Attendee has been deleted."
  end

  private
    def find_person
      @person = Person.find(params[:id])
    end
end
