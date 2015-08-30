require 'rails_helper'

# Acceptance Criteria
# [✓] There is an index page
# [✓] I can see a game/user data

feature "As a user
I want to see game/user data." do
  scenario "User views game/user data" do
    visit stats_path
    expect(page).to have_content("Data and Statistics")
  end
end
