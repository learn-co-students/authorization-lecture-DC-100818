class User < ApplicationRecord
  has_secure_password
  has_many :visitor_oddities, dependent: :destroy
  has_many :oddities, through: :visitor_oddities
  has_many :museums, through: :oddities
end
