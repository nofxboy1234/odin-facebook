require 'rails_helper'

RSpec.describe "Updating a post", type: :system do
  let!(:existing_user) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome
    login_as(existing_user)
  end

  scenario 'valid inputs' do
    post = create(:post)
    visit edit_post_path(post)
    fill_in 'Content', with: 'Test Post'
    click_on 'Update Post'
    visit posts_path
    expect(page).to have_content('Test Post')
  end
end
