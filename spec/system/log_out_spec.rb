require 'rails_helper'

RSpec.describe "Logging out", type: :system do
  let!(:user1) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome
    login_as(user1)
  end

  scenario 'user1 logs out after being logged in' do
    visit root_path

    expect(page).to have_current_path(root_path)
    click_link 'Logout'

    page.find('#new_user')
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
  end
end
