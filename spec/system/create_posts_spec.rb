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
    fill_in 'Author', with: existing_user.id
    # sleep(5)
    click_on 'Create Post'
    # sleep(5)
    visit posts_path
    # sleep(5)
    expect(page).to have_content('Goodbye world!')
  end

  scenario 'invalid inputs' do
    visit new_post_path
    fill_in 'Content', with: ''
    fill_in 'Author', with: ''
    click_on 'Create Post'
    expect(page).to have_content("Author can't be blank")
  end
end
