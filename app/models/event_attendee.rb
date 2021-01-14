class EventAttendee < ApplicationRecord
    enum status: [:invited, :accepted]
    belongs_to :attendee, class_name: "User"
    belongs_to :attended_event, class_name: "Event"
end
