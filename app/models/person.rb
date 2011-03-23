class Person < ActiveRecord::Base
  validates :fname, :lname, :email, :presence => true
  validates_uniqueness_of :email, :case_sensitive => false
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :promotions
  belongs_to :registration
  belongs_to :company
  
  def full_name
    [fname, lname].join(' ')
  end
  
  def company_name
    company.name if company
  end

  def company_name=(name)
    self.company = Company.find_or_create_by_name(name) unless name.blank?
  end
  
  def profile(options = {})
    attributes = [:full_name, :email, :job]
    attributes.map do |attribute|
    self.send(attribute)
    end.reject(&:blank?).compact
  end
  
  def registration_name
    registration.name if registration
  end
  
  def company_profile
    company.profile if company
  end
end
