class Product < ApplicationRecord
  has_many :line_items
  has_many_attached :photos
  has_many :orders, :through => :line_items
end
