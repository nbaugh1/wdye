class Visit < ApplicationRecord
    validates :description, presence: true
    validates :visit_date, presence: true
    
    belongs_to :user
    belongs_to :restaurant
end
