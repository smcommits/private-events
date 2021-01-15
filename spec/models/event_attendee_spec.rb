require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  let(:user) { User.create(username: 'Carl') }
  let(:event) { Event.create(title: 'Title', creator_id: 1, description: 'Something', event_date: '2021/12/12') }

  context 'Associations' do
    it { should belong_to(:attendee) }
    it { should belong_to(:attended_event) }
  end

  context 'Enum' do
    it 'should create a column named status with default value of invited' do
      new = EventAttendee.new(attendee_id: user.id, attended_event_id: event.id)
      new.save
      expect(new.status).to eq('invited')
    end
  end
end
