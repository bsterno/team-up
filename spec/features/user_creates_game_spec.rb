require 'rails_helper'

# Acceptance Criteria
# [✓] There is a new page
# [✓] I can submit a form to add a new game
# [✓] I am notified when I create a new game
# [✓] I am notified when a form is filled out incorrectly

feature "As a user
I want to add a game
so that others can join it" do
  scenario "User fills in a game form and submits it" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit games_path
    click_link 'Create New Game'
    fill_in :game_name, with: "5-Aside Madness"
    fill_in :game_sport, with: "Soccer"
    select "2015", from: :game_start_date_1i
    select "July", from: :game_start_date_2i
    select "15", from: :game_start_date_3i
    select "05 PM", from: :game_start_date_4i
    select "30", from: :game_start_date_5i
    fill_in :game_street_address, with: "123 Street"
    fill_in :game_city, with: "Boston"
    fill_in :game_max_players, with: "10"
    click_button "Create Game"

    expect(page).to have_content("Soccer")
    expect(page).to have_content("5-Aside Madness")
    expect(page).to have_content("10")
    expect(page).to have_content("Game Created")
  end
  scenario 'User fills in bathroom form with invalid information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit games_path
    click_link 'Create New Game'
    click_button "Create Game"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Sport can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Max players can't be blank")
  end
end
