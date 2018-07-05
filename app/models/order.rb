class Order < ApplicationRecord
  enum status: [:pending, :accepted, :declained]
  
  belongs_to :user
  has_many :line_items
  has_many :products, :through => :line_items
end
