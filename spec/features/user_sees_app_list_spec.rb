require 'rails_helper'

RSpec.feature 'User sees app list' do
  scenario 'User visits the apps index page' do
    create(:app, name: 'App name')
    user = create(:user)

    visit root_path

    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(current_path).to eq(apps_path)
    within('#apps') do
      expect(page).to have_content('Apps')
      within('.app') do
        expect(page).to have_content('App name')
      end
    end
  end
end
