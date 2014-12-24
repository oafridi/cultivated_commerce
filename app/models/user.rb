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

  geocoded_by :full_street_address
  after_validation :geocode

  validates :first_name, presence: true, length: { in: 2..40 }
  validates :last_name, presence: true, length: { in: 2..40 }

  def full_street_address
    "#{self.address_line_1}, #{self.city}, #{self.zipcode}"
  end

  def coords
    [self.latitude.to_f, self.longitude.to_f]
  end

end

