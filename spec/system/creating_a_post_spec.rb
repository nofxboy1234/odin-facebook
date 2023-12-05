require 'rails_helper'

RSpec.describe "Creating a post", type: :system do
  let!(:existing_user) do
    create(:user)
  end

  before(:each) do
    login_as(existing_user)
  end

  scenario 'user1 clicks New Post link on posts index view' do
    visit posts_path
    click_link 'New post'

    expect(page).to have_current_path(new_post_path)
    fill_in 'Content', with: 'Hello world!'
    click_button 'Create Post'

    expect(page).to have_current_path(posts_path)
    expect(page).to have_content('Hello world!')
  end
end
