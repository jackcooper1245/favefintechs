class User < ActiveRecord::Base
  validates_uniqueness_of :username
  has_secure_password
  has_many :fintechs
  has_many :reviews

end