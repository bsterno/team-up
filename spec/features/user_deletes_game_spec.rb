require 'rails_helper'

# Acceptance Criteria
# [✓] There is a delete button on the show page
# [✓] I can click the button to delete a game
# [✓] I am notified when I delete a game
# [✓] I can only see the delete button if I own the game

feature "As a user
I want to delete a game that I created
and all posts made for that game" do
  scenario "User deletes a game" do
    user = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game, user: user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to have_button("Delete Game")
    click_button "Delete Game"
    expect(page).to have_content("Game Deleted")
  end

  scenario "User that did not create the game cannot see the delete button" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game, user: user)
    visit new_user_session_path
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"
    visit game_path(game)

    expect(page).to_not have_button("Delete Game")
  end
end
