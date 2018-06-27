class Product < ApplicationRecord
  has_many :purchases
  has_many_attached :photos
  has_and_belongs_to_many :orders
end
