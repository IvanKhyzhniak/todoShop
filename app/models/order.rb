class Order < ApplicationRecord
  enum status: [:pending, :accepted, :declained]
  
  belongs_to :user
  has_many :purchases
  has_and_belongs_to_many :products
end
