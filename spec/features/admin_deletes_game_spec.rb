require 'rails_helper'

# Acceptance Criteria
# [✓] Admin views list of games and buttons to delete them
# [✓] Admin can delete games

feature "As an admin
I want to delete a game
so that the game no longer exists on the site" do
  scenario "Admin deletes game" do
    admin = FactoryGirl.create(:user, role: 'admin')
    game = FactoryGirl.create(:game)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit admin_games_path

    expect(page).to have_content(game.description)
    expect(page).to have_content(game.sport.name)
    expect(page).to have_content(game.start_date)
    expect(page).to have_content(game.max_players)
    click_button("Delete", match: :first)
    expect(page).to_not have_content(game.description)
  end
end
