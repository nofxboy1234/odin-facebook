require 'rails_helper'

RSpec.describe "Logging in", type: :system do
  let!(:user1) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome
  end

  scenario 'user1 logs in through the login page' do
    visit new_user_session_path
    expect(page).to have_content('Log in')

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Signed in successfully.')
  end
end
