require 'rails_helper'

RSpec.describe "Updating a user profile", type: :system do
  let!(:profile) do
    create(:profile, name: 'John Smith', birthday: '2023-12-08', user: user1)
  end

  let!(:user1) do
    create(:user)
  end

  before(:each) do
    # driven_by :selenium_chrome

    login_as(user1)
  end

  scenario 'user1 updates their profile' do
    visit profile_path(user1.profile)
    expect(page).to have_content('John Smith')
    click_link 'Edit this profile'

    expect(page).to have_content('Editing profile')
    year_select = page.find('#profile_birthday_1i')
    expect(year_select.value).to eq('2023')
    name_text_field = page.find('#profile_name')
    expect(name_text_field.value).to eq('John Smith')

    fill_in 'Name', with: 'Johnny Smithe'
    select '2022', from: 'profile_birthday_1i'
    click_button 'Update Profile'

    expect(page).to have_current_path(profile_path(user1.profile))
    expect(page).to have_content('Johnny Smithe')
    expect(page).to have_content('2022-12-08')
  end
end
