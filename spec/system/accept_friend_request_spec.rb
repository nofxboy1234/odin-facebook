require 'rails_helper'

RSpec.describe 'Accept Friend Request', type: :system do
  let!(:user1) do
    create(:user, email: 'user1@example.com')
  end

  let!(:user2) do
    create(:user, email: 'user2@example.com')
  end

  let!(:user3) do
    create(:user, email: 'user3@example.com')
  end

  before(:each) do
    # driven_by :selenium_chrome
  end

  context 'user1 has not received any friend request' do
    scenario 'log in as user1' do
      login_as(user1)
      visit notifications_path

      expect(page).not_to have_content('friend request from:')
    end
  end

  context 'user1 has received a friend request from [user2]' do
    scenario 'log in as user1' do
      notification = create(:notification, user: user1)
      create(:friend_request, sender: user2, receiver: user1,
                              notification:)

      login_as(user1)
      visit notifications_path

      expect(page).to have_content('friend request from: user2@example.com')

      accept_alert do
        within("div#user_#{user2.id}") do
          click_button 'Accept'
        end
      end

      expect(page).to have_current_path(notifications_path)

      expect(page).to have_content('Friend request was accepted!')

      expect(page).not_to have_content('friend request from: user2@example.com')
    end
  end

  context 'user1 has received a friend request from [user2, user3]' do
    scenario 'log in as user1' do
      notification = create(:notification, user: user1)
      create(:friend_request, sender: user2, receiver: user1,
                              notification:)

      notification = create(:notification, user: user1)
      create(:friend_request, sender: user3, receiver: user1,
                              notification:)

      login_as(user1)
      visit notifications_path

      expect(page).to have_content('friend request from: user2@example.com')
      expect(page).to have_content('friend request from: user3@example.com')

      accept_alert do
        within("div#user_#{user3.id}") do
          click_button 'Accept'
        end
      end

      expect(page).to have_current_path(notifications_path)

      expect(page).to have_content('Friend request was accepted!')

      expect(page).to have_content('friend request from: user2@example.com')
      expect(page).not_to have_content('friend request from: user3@example.com')
    end
  end
end
