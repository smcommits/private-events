require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { User.create(username: 'Mike') }
  scenario "Login user and redirect to event's index page" do
    visit '/login'

    fill_in 'Username', with: user.username
    click_button('Log In')

    expect(page).to have_current_path(root_path)
  end

  scenario 'It will failt o login when username is wrong' do
    visit '/login'

    fill_in 'Username', with: 'dsflkajdsf;kajsf;lkasdjf'
    click_button('Log In')

    expect(page).to have_current_path(login_path)
  end
end
