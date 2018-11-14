class Museum < ApplicationRecord
  has_many :oddities
  has_many :users, through: :oddities
  # has_one :gift_shop
end
