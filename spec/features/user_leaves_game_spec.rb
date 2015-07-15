require 'rails_helper'

# Acceptance Criteria
# [✓] There is a leave button on the show page
# [✓] I can click the button to leave a game
# [✓] I am notified when I leave a game
# [✓] I can only see the leave button if I am a player in the game

feature "As a user
I want to leave a game
so that I no longer am attending this game" do
  scenario "User joins a game" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game, user: user)
    FactoryGirl.create(:player, user: user2, game: game)
    FactoryGirl.create(:player, user: user, game: game)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to have_button("Leave Game")
    click_button "Leave Game"
    expect(page).to have_content("You've left this game")
    expect(page).to have_content(user2.email)
  end
end
