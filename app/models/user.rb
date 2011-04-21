class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable, :rememberable,
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model, :remember_me
  attr_accessible :email, :password, :password_confirmation, :username
  attr_accessor :login

  def to_s
    if self.admin?
      "#{self.username} - Admin"
    else
      "#{self.username}"
    end
  end

  private
    def self.find_for_database_authentication(warden_conditions)
       conditions = warden_conditions.dup
       login = conditions.delete(:login)
       where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
     end
end
