class Session < ApplicationRecord
  has_secure_token :auth_token
  belongs_to :user
  
  # before_create :assign_token

  # private
  # def assign_token
  #   self.auth_token = SecureRandom.uuid
  # end
  
end
