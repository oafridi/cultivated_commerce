class Listing < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  before_save :format

  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates_presence_of :item
  validates_presence_of :user

  def format
    self.title.downcase!
  end

  def self.search(query)
    query.downcase!
    where("title like ?", "%#{query}%")
  end
end
