class Company < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :state
  belongs_to :country
  belongs_to :sector
  has_many :people, :dependent => :destroy
  before_validation :strip_quotes

  default_scope order('name asc')

  acts_as_api
  api_accessible :name_only do |template|
    template.add :name
    template.add :city
    template.add :state_name, :as => :state
    template.add :country_name, :as => :country
  end

  delegate :name, :to => :country, :prefix => true
  delegate :name, :to => :state, :prefix => true
  delegate :name, :to => :sector, :prefix => true

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

  def strip_quotes
    self.name = self.name.to_s.gsub("\"", "")
  end
end

