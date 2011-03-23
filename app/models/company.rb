class Company < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :state
  belongs_to :country
  belongs_to :sector
  has_many :people

  def state_name
    state.name if state
  end

  def state_name=(name)
    self.state = State.find_or_create_by_name(name) unless name.blank?
  end

  def country_name
    country.name if country
  end

  def country_name=(name)
    self.country = Country.find_or_create_by_name(name) unless name.blank?
  end
  
  def sector_name
    sector.name if sector
  end
  
  def profile(options = {})
    attributes = [:name, :address1, :address2, :city, :state_name, :country_name, :sector_name]
    attributes.map do |attribute|
    self.send(attribute)
    end.reject(&:blank?).compact
  end
  
end

