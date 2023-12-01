require 'rails_helper'

RSpec.describe 'Deleting a post', type: :system do
  let!(:existing_user) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome
    login_as(existing_user)
  end

  scenario 'success' do
    post = create(:post, content: 'Remove me')
    visit posts_path
    expect(page).to have_content('Remove me')

    visit post_path(post)

    accept_alert do
      click_button 'Destroy this post'
    end

    expect(page).to have_current_path(posts_path)
    expect(page).not_to have_content('Remove me')
  end
end
