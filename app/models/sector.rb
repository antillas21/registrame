class Sector < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  has_many :companies
  
  default_scope order('name asc')
end
