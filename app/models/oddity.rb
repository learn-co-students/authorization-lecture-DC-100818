class Oddity < ApplicationRecord
  belongs_to :museum
  has_many :visitor_oddities
  has_many :users, through: :visitor_oddities
end
