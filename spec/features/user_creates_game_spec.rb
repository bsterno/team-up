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
    sport = FactoryGirl.create(:sport)
    state = FactoryGirl.create(:state)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit games_path
    click_link 'Create New Game'
    fill_in :game_description, with: "5-Aside Madness"
    select sport.name, from: :game_sport_id
    select state.name, from: :game_state_id
    fill_in :game_start_date, with: "2015-07-13T00:00:00"
    fill_in :game_street_address, with: "123 Street"
    fill_in :game_city, with: "Boston"
    fill_in :game_max_players, with: "10"
    click_button "Create Game"

    expect(page).to have_content("5-Aside Madness")
    expect(page).to have_content(sport.name)
    expect(page).to have_content(state.abbr)
    expect(page).to have_content("07/13, Monday")
    expect(page).to have_content("Boston")
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
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Sport can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Max players can't be blank")
  end
end
