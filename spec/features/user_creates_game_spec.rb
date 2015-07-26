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
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit games_path
    click_link 'new game'
    fill_in :game_description, with: "Field #3"
    select sport.name, from: :game_sport_id
    fill_in :game_start_date, with: "2015-07-13T00:00:00"
    fill_in :autocomplete, with: "123 Street"
    fill_in :game_max_players, with: "10"
    click_button "Create Game"

    expect(page).to have_content("Field #3")
    expect(page).to have_content(sport.name)
    expect(page).to have_content("Monday, July 13")
    expect(page).to have_content("10")
    expect(page).to have_content("Game Created")
  end

  scenario 'User creates a game and automatically is a player in that game' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    sport = FactoryGirl.create(:sport)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit games_path
    click_link 'new game'
    fill_in :game_description, with: "Field #3"
    select sport.name, from: :game_sport_id
    fill_in :game_start_date, with: "2015-07-13T00:00:00"
    fill_in :autocomplete, with: "123 Street"
    fill_in :game_max_players, with: "10"
    click_button "Create Game"

    expect(page).to have_content(user.name)
    expect(page).to_not have_content(user2.name)
    expect(page).to_not have_content(user3.name)
  end

  scenario 'User fills in game form with invalid information' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit games_path
    click_link 'new game'
    click_button "Create Game"
    expect(page).to have_content("Sport can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content("Max players can't be blank")
  end
end
