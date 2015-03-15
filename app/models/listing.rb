class Listing < ActiveRecord::Base
  extend ListingSearcher

  belongs_to :item
  belongs_to :user
  before_save :format

  scope :ordered, order(created_at: :desc)

  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :item, presence: true
  validates :user, presence: true

  delegate :img,
           :to => :user,
           :prefix => true

  def format
    self.title.downcase!
  end  
end
