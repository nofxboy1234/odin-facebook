require 'rails_helper'

RSpec.describe "ShowUsers", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  describe 'index page' do
    it 'shows all users' do
      visit users_path
      sleep(5)
      expect(page).to have_content('Users')
    end
  end
end
