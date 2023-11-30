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

    # sleep(0.1)
    puts "\nposts_path: #{posts_path}"
    
    puts "current_path: #{current_path}"
    expect(page).to have_current_path(posts_path)
    puts "current_path: #{current_path}"

    # save_and_open_page
    
    expect(page).not_to have_content('Remove me')
  end
end
