class Item < ActiveRecord::Base
  has_many :listings
  
  validates :kind, 
    presence: true,
    format: { with: /\A[a-zA-Z\s]*\z/, message: "can only contain letters" }
  validates :category, 
    presence: true    
end
