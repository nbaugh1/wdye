class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniquness: true

  has_many :visits
  has_many :restaurants, through: :visits
end
