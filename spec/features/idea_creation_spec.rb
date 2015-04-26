require 'rails_helper'

RSpec.describe 'idea creation' do
  context 'with valid attributes' do
    let(:kenny) do 
     User.create(username: "kenny",
                 password: "password",
                 )
     end
    it 'can create an idea' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(kenny)

      visit new_idea_path

      fill_in "idea[name]", with: "BOOM"
      fill_in "idea[description]", with: "KENSTER"
      click_link_or_button "Create Idea"

      expect(page).to have_content("BOOM")
      expect(page).to have_content("KENSTER")
      expect(page).to have_content("Your silly idea")
    end

  end 
end