class Data::PeopleController < Data::BaseController
  before_filter :find_person, :only => [:show, :edit, :update, :destroy]
  
  if NameBadge.count > 0
    @@label = NameBadge.first
    prawnto :prawn => {
                :page_layout => :portrait,
                :left_margin => ((@@label.left.to_f).in),
                :right_margin => ((@@label.right.to_f).in),
                :top_margin => ((@@label.top.to_f).in),
                :bottom_margin => ((@@label.bottom.to_f).in),
                :page_size => [((@@label.width.to_f).in), ((@@label.height.to_f).in)]
                }  
  end
  
  def index
    @people = Person.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @people, :root => :people }
      format.json { render_for_api :complete_record, :json => @people, :root => :people }
    end
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to data_person_path(@person), :notice => 'Added a new attendee.'
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
      format.pdf do
        qr_encode!
        printed
      end
    end
  end
  
  def update
    if @person.update_attributes(params[:person])
      redirect_to data_person_path(@person), :notice => "Attendee has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end
  
  def destroy
    @person.destroy
    redirect_to data_people_path, :notice => "Attendee has been deleted."
  end
  
  private
    def find_person
      @person = Person.find(params[:id])
    end
    
    def qr_encode!
      qrcodes = "#{RAILS_ROOT}/public/images/qrcodes"
      find_person
      RQR::QRCode.create(:auto_extent => true) do |code|
        code.save(@person.mecard, "#{qrcodes}/#{@person.id}.png")
      end
    end
    
    def printed
      find_person
      @person.update_attribute(:printed, true)
    end
end
