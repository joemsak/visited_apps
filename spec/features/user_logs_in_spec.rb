require 'rails_helper'

RSpec.feature 'Users log in' do
  scenario 'A user signs up' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: 'some@email.com'
    fill_in 'Password', with: 'somesecuresecret'
    fill_in 'Password confirmation', with: 'somesecuresecret'

    click_button 'Sign up'

    within('.alert-box.notice') do
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

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
