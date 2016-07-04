class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings

  has_many :events_participants, foreign_key: :participant_id
  has_many :events_hosts, foreign_key: :host_id

  has_many :events, through: :events_participants
  has_many :hosted_events, through: :events_hosts, source: :event

  geocoded_by :address

  unless Rails.env.test?
    after_validation :geocode, if: :address_changed?
  end

  validates :first_name, presence: true, length: {in: 2..40}
  validates :last_name, presence: true, length: {in: 2..40}

  def address
    "#{self.address_line_1}, #{self.city}, #{self.zipcode}"
  end

  def address_changed?
    if self.address_line_1 && self.city && self.zipcode
      (self.address_line_1_changed? || self.city_changed? || self.zipcode_changed?)
    else
      false
    end
  end

  def coordinates
    [self.latitude.to_f, self.longitude.to_f]
  end

end

