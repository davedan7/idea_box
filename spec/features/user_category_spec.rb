require 'rails_helper'

RSpec.describe 'User can select a category' do

  context "with valid credentials" do
    let(:admin) do
        User.create(username: "admin",
                  password: "pass",
                  role: 1)
    end

    let(:default_user) do
      User.create(username: "default_user",
                  password: "pass",
                  role: 0)
    end

    it "displays categories" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      click_link_or_button "New Category"
      fill_in "category[name]", with: "colors"
      click_button "Create Category"
      expect(page).to have_content("colors")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit new_idea_path
      fill_in "idea[name]", with: "my idea"
      fill_in "idea[description]", with: "description of my idea"
      select("colors", :from => "idea[category_id]")
      click_button "Create Idea"

      expect(page).to have_content("description of my idea")
      expect(page).to have_content("colors")

    end
  end

end