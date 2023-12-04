require 'rails_helper'

RSpec.describe "Creating a post", type: :system do
  let!(:existing_user) do
    create(:user)
  end

  before(:each) do
    login_as(existing_user)
  end

  scenario 'valid inputs' do
    visit new_post_path
    fill_in 'Content', with: 'Goodbye world!'
    click_on 'Create Post'

    expect(page).to have_current_path(posts_path)
    expect(page).to have_content('Goodbye world!')
  end
end
