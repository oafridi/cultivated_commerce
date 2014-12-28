ZIP_CODE_REG_EX = %r{\d{5}(-\d{4})?}

class Event < ActiveRecord::Base
  attr_accessor :distance, :counter

  geocoded_by :address
  
  unless Rails.env.test?
    after_validation :geocode,
  :if => lambda{ |obj| obj.address_changed? }
  end
  reverse_geocoded_by :latitude, :longitude

  validates :title, presence: true, length: { in: 3..30 }
  validates :address_line_1, presence: true, length: { in: 7..70 }
  validates :city, presence: true, length: { in: 3..50 }
  validates :zipcode, presence: true
  validates :state, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                    message: "only allows letters" }
  validates :date, presence: true
  validates :description, presence: true, length: { in: 8..300 }

  has_many :events_participants
  has_many :events_hosts

  has_many :participants, class_name: "User", through: :events_participants
  has_many :hosts, class_name: "User", through: :events_hosts

  def address
    "#{self.address_line_1}, #{self.city}, #{self.zipcode}"
  end

  def address_changed?
    (self.address_line_1.changed? || self.city.changed? || self.zipcode.changed?)
  end

  def coordinates
    [self.latitude.to_f, self.longitude.to_f]
  end
end