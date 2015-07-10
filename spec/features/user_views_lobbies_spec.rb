require 'rails_helper'

# Acceptance Criteria
# [x] There is an index page
# [x] I can see a list of lobbies

feature "As a user
I want to see a list of game lobbies." do
  scenario "User views a list of lobbies" do
    user = FactoryGirl.create(:user)
    lobby = Lobby.create!(
      user: user,
      game: "Counter-Strike",
      name: "Competitive Matchmaking",
      max_players: 5,
      )
    visit lobbies_path
    expect(page).to have_content(lobby.name)
    expect(page).to have_content(lobby.game)
  end
end
