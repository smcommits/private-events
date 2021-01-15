require "rails_helper"

RSpec.feature "Create Event", :type => :feature do

  let(:user) {User.create(username: "Mike")}
  scenario "Event creation will fail if not logged in and redirect to login page" do
    visit "/events/new"

    expect(page).to have_current_path(login_path)
  end


  scenario "Event can be created if a user is logged in" do

    visit "/login"

    fill_in "Username", :with => user.username
    click_button("Log In")

    visit "/events/new"

    fill_in "event_title", :with => "Title"
    fill_in "event_event_date", :with => "2021/11/12"
    fill_in "event_description", :with => "Description"

    click_button("Create Event")

    expect(page).to have_current_path(event_path(Event.first.id))
  end

  

end
