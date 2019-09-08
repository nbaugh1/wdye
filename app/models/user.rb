class User < ApplicationRecord
  has_secure_password
  has_many :visits
  has_many :restaurants, through: :visits
end
