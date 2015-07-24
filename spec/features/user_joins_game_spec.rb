require 'rails_helper'

# Acceptance Criteria
# [✓] There is a join button on the show page
# [✓] I can click the button to join a game
# [✓] I am notified when I join a game
# [✓] I can only see the join button if I am not a player in the game

feature "As a user
I want to join a game
so that I take up a slot" do
  scenario "User joins a game" do
    user = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to have_button("Join Game")
    click_button "Join Game"
    expect(page).to have_content("Game Joined")
    expect(page).to have_content(user.name)
  end

  scenario "User cannot join they have already joined" do
    user = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game)
    FactoryGirl.create(:player, user: user, game: game)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to_not have_button("Join Game")
    expect(page).to have_button("Leave Game")
  end
end
