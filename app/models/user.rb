class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable, :rememberable,
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model, :remember_me
  attr_accessible :email, :password, :password_confirmation
end
