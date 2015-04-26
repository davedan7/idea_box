require 'rails_helper'

RSpec.describe "user account creation" do
  context 'with valid attributes' do
    it "can create a new user" do
      visit new_user_path

      fill_in "user[username]", with: "Kenny"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("Welcome, Kenny")
    end
  end

end