require 'rails_helper'

# Acceptance Criteria
# [✓] I can search for games by city
# [✓] I am brought to a list of games happening in that city

feature "As a user
I want to search for a game by city
so that I can see what games are in my area" do
  scenario "User fills in valid search" do
    FactoryGirl.create(:game, description: "Court #6", street_address: "35 Chicago Pedway System, Chicago, IL, United States")
    FactoryGirl.create(:game, description: "Court #5", street_address: "43 Mount Pleasant Street, Somerville, MA, United States")
    visit root_path
    fill_in :q, with: 'Somer'
    click_button 'search'

    expect(page).to have_content('Court #5')
    expect(page).to_not have_content('Court #6')
  end
end
