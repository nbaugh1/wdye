class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :visits
  has_many :users, through: :visits

  
end
