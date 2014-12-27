ZIP_CODE_REG_EX = %r{\d{5}(-\d{4})?}

class Event < ActiveRecord::Base
  attr_accessor :distance, :counter

  geocoded_by :address
  
  unless Rails.env.test?
    after_validation :geocode, if: self.address_changed?
  end
  reverse_geocoded_by :latitude, :longitude

  has_many :events_participants
  has_many :events_hosts

  has_many :participants, class_name: "User", through: :events_participants
  has_many :hosts, class_name: "User", through: :events_hosts

  def address
    "#{self.address_line_1}, #{self.city}, #{self.zipcode}"
  end

  def coordinates
    [self.latitude.to_f, self.longitude.to_f]
  end
end