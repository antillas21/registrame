class Person < ActiveRecord::Base
  validates :fname, :lname, :email, :presence => true
  #NameRegex = /\A[\w\s\.\-\+]+\z/i
  #validates_format_of :fname, :lname, :with => NameRegex, :message => "No puede contener comillas."
  validates_uniqueness_of :email, :case_sensitive => false
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :promotions
  belongs_to :registration
  belongs_to :company
  accepts_nested_attributes_for :company
  
  acts_as_api
  api_accessible :complete_record do |template|
    template.add :fname, :as => :first_name
    template.add :lname, :as => :last_name
    template.add :email
    template.add :job
    template.add :company_name, :as => :company
    template.add :registration_name, :as => :registration_type
    template.add :interests
    template.add :promotions
  end
  
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
