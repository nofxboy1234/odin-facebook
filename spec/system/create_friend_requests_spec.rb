require 'rails_helper'

RSpec.describe 'CreateFriendRequests', type: :system do
  let!(:existing_user) do
    create(:user)
  end

  before(:each) do
    driven_by :selenium_chrome

    create_list(:user, 2)
    login_as(existing_user)
  end

  scenario 'valid inputs' do
    visit users_path

    user_to_add = User.second
    user_id = user_to_add.id

    accept_alert do
      within("div#user_#{user_id}") do
        click_button 'Add Friend'
      end
    end

    expect(page).to have_current_path(friend_requests_path)
    expect(page).to have_content('Friend request was successfully created.')
    expect(page).to have_content("sender: #{existing_user.email}")
    expect(page).to have_content("receiver: #{user_to_add.email}")
  end
end
