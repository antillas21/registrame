class Data::CompaniesController < Data::BaseController
  before_filter :find_company, :only => [:show, :edit, :update, :destroy, :people, :encode_people]
  
  if NameBadge.count > 0
    @@label = NameBadge.first
    prawnto :prawn => { :page_layout => :portrait, :left_margin => ((@@label.left.to_f).in),
      :right_margin => ((@@label.right.to_f).in), :top_margin => ((@@label.top.to_f).in),
      :bottom_margin => ((@@label.bottom.to_f).in),
      :page_size => [((@@label.width.to_f).in), ((@@label.height.to_f).in)] }
  end
  
  def index
    @companies = Company.where('name LIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.html
      format.xml { render_for_api :name_only, :xml => @companies, :root => :companies }
      format.json { render_for_api :name_only, :json => @companies, :root => :companies }
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to data_company_path(@company), :notice => "Added new company."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render_for_api :name_only, :xml => @company }
      format.json { render_for_api :name_only, :json => @company }
    end
  end

  def edit

  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to data_company_path(@company), :notice => "Company has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to data_companies_path, :notice => "Company has been deleted."
  end
  
  def people
    @people = @company.people
    respond_to do |format|
      format.html
      format.pdf { encode_people }
    end
  end
  
  def encode_people
    @people = @company.people
    @qrcodes = "#{RAILS_ROOT}/public/images/qrcodes"
    @people.each do |person|
      RQR::QRCode.create(:auto_extent => true) do |code|
        code.save(person.mecard, "#{@qrcodes}/#{person.id}.png")
      end
      person.update_attribute(:printed, true)
    end
  end

  private
    def find_company
      @company = Company.find(params[:id])
    end
end
