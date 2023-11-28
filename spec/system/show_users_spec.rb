require 'rails_helper'

RSpec.describe "ShowUsers", type: :system do
  before(:each) do
    # driven_by(:rack_test)
    login_as(create(:user))
  end

  describe 'index page' do
    it 'shows all users' do
      p "Capybara.current_driver -- #{Capybara.current_driver}"
      visit users_path
      sleep(5)
      expect(page).to have_content('Users')
    end
  end
end
