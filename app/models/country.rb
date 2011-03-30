class Country < ActiveRecord::Base
  validates :name, :presence => true
  has_many :companies
  default_scope order('name asc')
end

