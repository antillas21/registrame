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
end
