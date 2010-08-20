class User < ActiveRecord::Base
  attr_accessible :lname, :fname, :email, :job
  validates_presence_of :lname, :fname, :email
  validates_uniqueness_of :email, :case_sensitive => false
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
  belongs_to :company
  belongs_to :department
  belongs_to :registration
end
