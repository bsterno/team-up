require 'rails_helper'

# Acceptance Criteria
# [ ] I can go to mygames to see all games that I am attending
# [ ] I can only see the mygames link if I am logged in

feature "As a user
I want to go to my games
so that I can see all the games that I am attending" do
  scenario "User goes to mygames" do
    user = FactoryGirl.create(:user)
    game = FactoryGirl.create(:game)
    game2 = FactoryGirl.create(:game)
    FactoryGirl.create(:player, user: user, game: game)
    FactoryGirl.create(:player, user: user, game: game2)

    user2 = FactoryGirl.create(:user)
    game3 = FactoryGirl.create(:game)
    FactoryGirl.create(:player, user: user2, game: game3)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_link "My Games"

    expect(page).to have_content(game.description)
    expect(page).to have_content(game2.description)
    expect(page).to_not have_content(game3.description)
  end
end
