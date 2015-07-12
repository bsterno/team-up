require 'rails_helper'

# Acceptance Criteria
# [x] There is an index page
# [x] I can see a list of games

feature "As a user
I want to see a list of sport games." do
  scenario "User views a list of games" do
    user = FactoryGirl.create(:user)
    game = Game.create!(
      user: user,
      sport: "Soccer",
      name: "5-Aside Madness",
      max_players: 10,
      )
    visit games_path
    expect(page).to have_content(game.name)
    expect(page).to have_content(game.sport)
    expect(page).to have_content(game.max_players)
    expect(page).to have_content(user.email)
  end
end
