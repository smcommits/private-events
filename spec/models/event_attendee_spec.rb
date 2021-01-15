require 'rails_helper'

RSpec.describe EventAttendee, type: :model do

  let(:user) { User.create(username: "Carl") }
  let(:event) {Event.create(title: "Title", creator_id: 1, description: "Something", event_date: "2021/12/12")}

  context "Associations" do 
    it {should belong_to(:attendee)}
    it {should belong_to(:attended_event)}
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
