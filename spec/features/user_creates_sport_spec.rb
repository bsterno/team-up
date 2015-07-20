require 'rails_helper'

# Acceptance Criteria
# [✓] There is a page to add a sport
# [✓] I must specify a sport name
# [✓] If I do not input the required information I am presented with errors
# [✓] If I input the required information, the sport is saved and I am
# redirected to the create game page

feature "As a user
I want to add a sport
so that others can select it when creating a game" do
  scenario "User fills in a sport form and submits it" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit new_sport_path

    fill_in :sport_name, with: "Soccer"
    click_button "Add Sport"

    expect(page).to have_content("Sport Added")
  end

  scenario 'User incorrectly fills in sport form' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit new_sport_path

    click_button "Add Sport"

    expect(page).to have_content("can't be blank")
  end
end
