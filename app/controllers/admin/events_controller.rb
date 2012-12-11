class Admin::EventsController < Admin::BaseController
  before_filter :find_event, :only => [:show, :edit, :update]

  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @events, :root => :events }
      format.json { render_for_api :complete_record, :json => @events, :root => :events }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to admin_events_path, :notice => "Added new event."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to admin_events_path, :notice => "Event info has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  private
    def find_event
      @event = Event.find(params[:id])
    end
end
