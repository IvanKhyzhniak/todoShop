class User < ApplicationRecord
  has_many :orders
  has_many :sessions

  validates_uniqueness_of :email
  validates_length_of :password, minimum: 6

  has_secure_password

end
