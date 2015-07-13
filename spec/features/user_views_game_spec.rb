require 'rails_helper'

# Acceptance Criteria
# [x] I can click on a game from the index page
# [x] There is a show page for a game
# [x] I can see details about the game on the show page

feature "As an authenticated user
I want to view the details about a game
So that I can get more information about it" do
  scenario 'User clicks on a game location
  and is brought to the game show page' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    game = FactoryGirl.create(:game, user: user)
    visit games_path
    click_link game.name

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.sport)
    expect(page).to have_content(game.street_address)
    expect(page).to have_content(game.city)
    expect(page).to have_content(game.start_date)
    expect(page).to have_content(game.max_players)
  end
end