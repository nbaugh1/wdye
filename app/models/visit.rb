class Visit < ApplicationRecord

    #validates :visit_date, presence: true
    validates :description, presence: true
    
    
    belongs_to :user
    belongs_to :restaurant
end
