require 'rails_helper'

RSpec.describe "Updating a post", type: :system do
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

  scenario 'valid inputs' do
    create(:friendship, user: user1, friend: user2)
    post = create(:post, author: user2)

    visit edit_post_path(post)
    fill_in 'Content', with: 'Test Post'
    click_on 'Update Post'
    visit posts_path
    # debugger
    expect(page).to have_content('Test Post')
  end
end
