require 'rails_helper'

RSpec.describe "ShowUsers", type: :system do
  before(:each) do
    # driven_by(:rack_test)
    login_as(create(:user))
    # create_list(:user, 3)
  end

  scenario 'index page' do
    p "Capybara.current_driver -- #{Capybara.current_driver}"
    visit users_path
    sleep(5)
    expect(page).to have_content('Users')
  end
end
