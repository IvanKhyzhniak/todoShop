class User < ApplicationRecord
  has_many :line_items
  has_many :orders
  has_many :sessions
    
  def full_name
    [first_name, last_name].join(' ')
  end
end
