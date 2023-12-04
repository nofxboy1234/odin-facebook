require 'rails_helper'

RSpec.describe 'CreateFriendRequests', type: :system do
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

  context 'user1 has sent friend request to user2' do
    scenario 'log in as user1 with no friends' do
      login_as(user1)
      visit users_path
  
      expect(page).not_to have_content('user1@example.com')
      expect(page).to have_content('user2@example.com')
      expect(page).to have_content('user3@example.com')
  
      accept_alert do
        within("div#user_#{user2.id}") do
          click_button 'Add Friend'
        end
      end
  
      expect(page).to have_current_path(users_path)
  
      expect(page).to have_content('Friend request was successfully created.')
      expect(page).not_to have_content('user2@example.com')
    end
  end

  scenario 'log in as user1 while having sent a friend request to [user2]' do
    notification = create(:notification, user: user2)
    create(:friend_request, sender: user1, receiver: user2,
                            notification:)
    # debugger
    # create(:friendship, user: user2, friend: user3)

    login_as(user1)
    visit users_path

    expect(page).not_to have_content('user1@example.com')
    expect(page).not_to have_content('user2@example.com')
    expect(page).to have_content('user3@example.com')

    accept_alert do
      within("div#user_#{user3.id}") do
        click_button 'Add Friend'
      end
    end

    expect(page).to have_current_path(friend_requests_path)

    expect(page).to have_content('Friend request was successfully created.')
    expect(page).to have_content("sender: #{user1.email}")
    expect(page).to have_content("receiver: #{user3.email}")
  end

  scenario 'log in as user1 while having received a friend request from [user2]' do
    notification = create(:notification, user: user1)
    create(:friend_request, sender: user2, receiver: user1,
                            notification:)
    # debugger
    # create(:friendship, user: user2, friend: user3)

    login_as(user1)
    visit users_path

    expect(page).not_to have_content('user1@example.com')
    expect(page).not_to have_content('user2@example.com')
    expect(page).to have_content('user3@example.com')

    accept_alert do
      within("div#user_#{user3.id}") do
        click_button 'Add Friend'
      end
    end

    expect(page).to have_current_path(friend_requests_path)

    expect(page).to have_content('Friend request was successfully created.')
    expect(page).to have_content("sender: #{user1.email}")
    expect(page).to have_content("receiver: #{user3.email}")
  end

  scenario 'log in as user1 while being friends with [user2]' do
    create(:friendship, user: user1, friend: user2)

    login_as(user1)
    visit users_path

    expect(page).not_to have_content('user1@example.com')
    expect(page).not_to have_content('user2@example.com')
    expect(page).to have_content('user3@example.com')

    accept_alert do
      within("div#user_#{user3.id}") do
        click_button 'Add Friend'
      end
    end

    expect(page).to have_current_path(friend_requests_path)

    expect(page).to have_content('Friend request was successfully created.')
    expect(page).to have_content("sender: #{user1.email}")
    expect(page).to have_content("receiver: #{user3.email}")
  end
end
