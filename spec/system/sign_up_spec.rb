require 'rails_helper'

RSpec.describe "Signing up", type: :system do
  before(:each) do
    # driven_by :selenium_chrome
  end

  scenario 'A new user signs up for the first time' do
    visit new_user_registration_path

    page.find('#new_user')
    expect(page).to have_current_path(new_user_registration_path)
    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '111111'
    
    click_button 'Sign up'

    page.find('a', text: 'new_user')
    page.find('h1', text: 'Posts')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
