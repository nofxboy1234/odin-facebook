require 'rails_helper'

RSpec.describe 'Deleting a post', type: :system do
  let!(:user1) do
    create(:user)
  end

  let!(:user2) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome
    login_as(user1)
  end

  scenario 'success' do
    create(:friendship, user: user1, friend: user2)
    post = create(:post, content: 'Remove me', author: user2)
    visit posts_path
    expect(page).to have_content('Remove me')

    visit post_path(post)

    accept_alert do
      click_button 'Destroy this post'
    end

    
    expect(page).to have_current_path(posts_path)

    expect(page).to have_content('Post was successfully destroyed.')
    expect(page).not_to have_content('Remove me')
  end
end
