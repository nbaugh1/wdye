class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true

  has_many :visits
  has_many :restaurants, :through => :visits

  def self.find_or_create_by_omniauth(auth)
    @user = User.find_by(email: auth["info"]["email"])
    if @user 
      @user.update(uid: auth["uid"])
    else
      @user = User.find_or_create_by(uid: auth["uid"]) do |u|
        u.email = auth["info"]["email"]
        u.username = auth["info"]["name"]
        u.password = SecureRandom.hex
      end
    end
    @user
  end
end
