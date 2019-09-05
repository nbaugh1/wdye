class User < ApplicationRecord
  has_many :visits
  has_many :restaurants, through: :visits
end
