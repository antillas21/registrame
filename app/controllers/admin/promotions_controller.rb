class Admin::PromotionsController < Admin::BaseController
  before_filter :find_promotion, :only => [:show, :edit, :update, :destroy]

  def index
    @promotions = Promotion.all
    respond_to do |format|
      format.html
      format.xml { render_for_api :complete_record, :xml => @promotions, :root => :promotions }
      format.json { render_for_api :complete_record, :json => @promotions, :root => :promotions }
    end
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(params[:promotion])
    if @promotion.save
      redirect_to admin_promotions_path, :notice => "Added new promotion media."
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
    if @promotion.update_attributes(params[:promotion])
      redirect_to admin_promotions_path, :notice => "Promotion media has been updated."
    else
      flash[:error] = "There were some errors. Please correct them before proceeding."
      render 'edit'
    end
  end

  def destroy
    @promotion.destroy
    redirect_to admin_promotions_path, :notice => "Promotion media has been deleted."
  end

  private
    def find_promotion
      @promotion = Promotion.find(params[:id])
    end
end
