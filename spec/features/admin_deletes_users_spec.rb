require 'rails_helper'

# Acceptance Criteria
# [✓] Admin views a list of users and buttons to delete them
# [✓] Admin can delete users

feature "As an admin
I want to delete users
so that they no longer have an account" do
  scenario "Admin deletes user" do
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
    click_button("Delete", match: :first)
    expect(page).to_not have_content(user.email)
  end
end
