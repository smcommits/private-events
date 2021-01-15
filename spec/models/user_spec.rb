require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it {should have_many(:created_events)}
    it {should have_many(:event_attendees)}
    it {should have_many(:attended_events)}
  end

  context 'Validations' do
    it "should not be valid without a username" do 
      user = User.new(username: nil)
      expect(user).to_not be_valid
    end

    it "shoud be valid when a username is provided" do
      user = User.new(username: "Something") 
      expect(user).to be_valid
    end

    it "should not be valid without a unique username" do
      user = User.create(username: "Simba")
      user2 = User.new(username: "Simba")
      expect(user2).to_not be_valid
    end

 end

end
