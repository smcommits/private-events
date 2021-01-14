class EventAttendee < ApplicationRecord
  scope :get_invitation, lambda { |user_id, event_id|
                           where('attendee_id = ? AND attended_event_id == ?', user_id, event_id)
                         }
  scope :check_invitation, lambda { |event_id, user_id, status|
                             where('attended_event_id = ? AND attendee_id = ? AND status = ?',
                                   event_id, user_id, status)
                           }
  enum status: %i[invited accepted]
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
