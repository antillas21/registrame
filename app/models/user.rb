class User < ActiveRecord::Base
  #attr_accessible :lname, :fname, :email, :job, :department_id, :company_id
  validates_presence_of :lname, :fname, :registration_id
  validates_uniqueness_of :email, :case_sensitive => false
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => EmailRegex
  
  belongs_to :company
  belongs_to :department
  belongs_to :registration
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :promos
  
  named_scope :attendee, :conditions => [ 'printed = ?', true ]
  
  def full_name
    [lname, fname].join(', ')
  end
  
  def label_name
    [fname, lname].join(' ')
  end
  
  def department_name
    department.name if department
  end
  
  def department_name=(name)
    self.department = Department.find_or_create_by_name(name) unless name.blank?
  end
  
  def company_name
    company.name if company
  end
  
  def company_name=(name)
    self.company = Company.find_or_create_by_name(name) unless name.blank?
  end
  
end
