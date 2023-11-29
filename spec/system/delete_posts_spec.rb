require 'rails_helper'

RSpec.describe "Deleting a post", type: :system do
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

    sleep(0.1)
    
    save_and_open_page
    expect(page).to have_content('Remove me')
    sleep(2)
  end
end
