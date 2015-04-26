require 'rails_helper'

RSpec.describe 'user logout' do
  context 'with valid credentials' do
    it 'logs out an authorized user' do
      User.create(username: "Kenny",
                  password: "password",
                  password_confirmation: "password")

      visit login_path
      fill_in "session[username]", with: "Kenny"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      expect(page).to have_content("Welcome, Kenny")

      click_link_or_button "Logout"
      expect(page).to have_content("Peace out")
    end
  end
end