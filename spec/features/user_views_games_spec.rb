require 'rails_helper'

# Acceptance Criteria
# [✓] There is an index page
# [✓] I can see a list of games

feature "As a user
I want to see a list of sport games." do
  scenario "User views a list of games" do
    game = FactoryGirl.create(:game)
    visit games_path
    expect(page).to have_content(game.description)
    expect(page).to have_content(game.sport.name)
    expect(page).to have_content(game.start_date)
    expect(page).to have_content(game.max_players)
  end
end
