require 'rails_helper'

RSpec.describe 'Commenting on a post', type: :system do
  let!(:user1) do
    create(:user)
  end

  let!(:user2) do
    create(:user)
  end

  let!(:post) do
    create(:post, author: user2)
  end

  before(:each) do
    # driven_by :selenium_chrome

    create(:friendship, user: user1, friend: user2)
    login_as(user1)
  end

  context 'user1 is friends with user2' do
    scenario 'user1 comments on a post made by user2' do
      visit posts_path
      within("div#post_#{post.id}") do
        click_link 'Add Comment'
      end

      page.find('h1', text: 'New comment')

      fill_in 'Content', with: 'So cool!'
      click_button 'Create Comment'

      expect(page).to have_current_path(posts_path)
      expect(page).to have_content('Comment was successfully created.')
      expect(page).to have_content('So cool!')
    end
  end
end
