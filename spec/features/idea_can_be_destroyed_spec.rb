require 'rails_helper'

RSpec.describe do 
  context 'click and destroy' do
    let(:kenny) do 
     User.create(username: "kenny",
                 password: "password",
                 )
     end

    it 'can be deleted' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(kenny)
      visit new_idea_path

      fill_in "idea[name]", with: "Acquire Currency"
      fill_in "idea[description]", with: "Find females"

      click_link_or_button "Create Idea"
      
      expect(page).to have_content("Acquire Currency")
      expect(page).to have_content("Find females")

      click_link_or_button "This idea is shit"

      expect(page).not_to have_content("Acquire Currency")
      expect(page).not_to have_content("Find females")

    end
  end
end