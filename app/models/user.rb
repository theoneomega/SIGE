class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,#:database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
#  has_one :analyst
  belongs_to :analyst
  belongs_to :role
  has_many :colaborations
  has_many :iphs
  has_one :activity

  
  audited
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_sign_in_at, :current_sign_in_at
  attr_accessible :analyst_id, :id, :username
  attr_accessor :login
  attr_accessible :login, :role_id
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
