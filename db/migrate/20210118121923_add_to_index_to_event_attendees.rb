class AddToIndexToEventAttendees < ActiveRecord::Migration[6.1]
  def change
    add_index :event_attendees, :attendee
    add_index :event_attendees, :attended_event
  end
end
