require 'rails_helper'

RSpec.describe'admin categories' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(username: "Admin",
                  password: "pw",
                  role: 1)
    end

    it 'displays the categories' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      expect(page).to have_content("Current Categories")
    end

    it "redirects to new category path" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      click_link_or_button "New Category"
      expect(current_path).to eq(new_admin_category_path)
    end

    it "creates a new category" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "category[name]", with: "catty"
      click_button "Create Category"
      expect(page).to have_content("catty")
    end

    it "deletes a category" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "category[name]", with: "category to delete"
      click_button "Create Category"
      expect(page).to have_content("category to delete")
      click_link "Categories Index"

      click_button "Delete Category"
      expect(page).to_not have_content("category to delete")
    end

  end

  context 'with default user logged in' do
    let(:user) do
      User.create(username: "default_user",
                  password: "pw",
                  role: 0)
    end

    it "displays a 404 error" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_categories_path
      expect(page).to have_content("404")
    end
  end

end