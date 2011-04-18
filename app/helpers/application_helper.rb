module ApplicationHelper
  def interests?
    Interest.count > 0
  end
  
  def sectors?
    Sector.count > 0
  end
  
  def promotions?
    Promotion.count > 0
  end
  
  def registrations?
    Registration.count > 0
  end
  
  def event?
    Event.count > 0
  end
  
  def app_event
    if event?
      @app_event = Event.first
    end
  end
  
  def logged_user?
    if current_user.try(:admin?)
      render :partial => 'admin/base/adminheader'
    elsif current_user
      render :partial => 'layouts/dataheader'
    else
      ""
    end
  end
end
