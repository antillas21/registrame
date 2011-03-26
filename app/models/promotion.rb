class Promotion < ActiveRecord::Base
  validates :name, :presence => true
  has_and_belongs_to_many :people
  
  acts_as_api
  api_accessible :complete_record do |template|
    template.add :name
  end
end
