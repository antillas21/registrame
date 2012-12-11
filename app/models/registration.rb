class Registration < ActiveRecord::Base
  validates :name, :presence => true
  has_many :people
end
