require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it {should have_many(:created_events)}
    it {should have_many(:event_attendees)}
    it {should have_many(:attended_events)}
  end
end
