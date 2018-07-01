class Purchase < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user, required: false
  belongs_to :product, required: false
end
