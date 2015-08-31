require 'rails_helper'

# Acceptance Criteria
# [✓] Admin views a list of users

feature "As an admin
I want to see statistics and data of games
so that I can learn more about the users on my site" do
  scenario "Admin visits stats index" do
    admin = FactoryGirl.create(:user, role: 'admin')
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit admin_stats_path

    expect(page).to have_content("Data and Statistics")
  end

  scenario 'unauthorized users are redirected' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit admin_users_path
    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end

end
