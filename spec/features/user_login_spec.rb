require 'rails_helper'

RSpec.describe 'user login' do
  context 'with valid credentials' do
    it 'logs in an authorized user' do
      User.create(username: "Kenny",
                  password: "password",
                  password_confirmation: "password")

      visit login_path
      fill_in "session[username]", with: "Kenny"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      expect(page).to have_content("Welcome, Kenny")
    end
  end
end