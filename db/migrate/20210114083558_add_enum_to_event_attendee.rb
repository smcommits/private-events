class AddEnumToEventAttendee < ActiveRecord::Migration[6.1]
  def change
    add_column :event_attendees, :status, :integer, default: 0
  end
end
