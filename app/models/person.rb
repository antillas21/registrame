class Person < ActiveRecord::Base
  validates :fname, :lname, :email, :presence => true
  validates_uniqueness_of :email, :case_sensitive => false
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :promotions
  belongs_to :registration
  
  def full_name
    [fname, lname].join(' ')
  end
end
