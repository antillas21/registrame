class Company < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :users
  belongs_to :country
  belongs_to :state
  belongs_to :sector
  
  def state_name
    state.name if state
  end
  
  def state_name=(name)
    self.state = State.find_or_create_by_name(name) unless name.blank?
  end
end
