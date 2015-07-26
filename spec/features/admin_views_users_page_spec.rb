require 'rails_helper'

# Acceptance Criteria
# [✓] Admin views a list of users

feature "As an admin
I want to see a list of all users
so that I can see who is registered on my site" do
  scenario "Admin visits users index" do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit admin_users_path

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.image)
    expect(page).to have_content(user.sign_in_count)
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
