require 'rails_helper'

# Acceptance Criteria
# [ ] There is a new page
# [ ] I can submit a form to add a new lobby
# [ ] I am notified when I create a new lobby
# [ ] I am notified when a form is filled out incorrectly

feature "As a user
I want to add a lobby
so that others can join it" do
  scenario "User fills in a lobby form and submits it" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit lobbies_path
    click_link 'Create New Lobby'
    fill_in :lobby_game, with: "Counter-Strike"
    fill_in :lobby_name, with: "Competitive Matchmaking - Dust 2"
    fill_in :lobby_max_players, with: "5"
    click_button "Create Lobby"

    expect(page).to have_content("Counter-Strike")
    expect(page).to have_content("Competitive Matchmaking - Dust 2")
    expect(page).to have_content("5")
  end
end
