class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true

  has_many :visits
  has_many :restaurants, through: :visits

  def self.create_from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
    end
  end
end
