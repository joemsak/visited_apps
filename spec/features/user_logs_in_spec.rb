require 'rails_helper'

RSpec.feature 'Users log in' do
  scenario 'A user logs in with correct credentials' do
    user = create(:user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    within('.alert-box.notice') do
      expect(page).to have_content('Signed in successfully.')
    end

    within('#site-header') do
      expect(page).to have_content(user.email)
      expect(page).to have_link('Logout', href: user_session_path)
    end
  end
end
