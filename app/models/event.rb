class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  scope :future, -> { where('event_date >= ?', Date.today) }
  scope :past, -> { where('event_date < ?', Date.today) }
end
