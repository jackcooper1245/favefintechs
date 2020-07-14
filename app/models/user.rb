class User < ActiveRecord::Base
  validates_uniqueness_of :username, :email
  has_secure_password
  has_many :fintechs
end