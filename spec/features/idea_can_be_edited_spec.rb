require 'rails_helper'

RSpec.describe 'idea creation' do
  context 'with valid attributes' do
    let(:kenny) do 
     User.create(username: "kenny",
                 password: "password",
                 )
     end
    it 'can be edited' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(kenny)
      idea = kenny.ideas.create(name: "BOOM", description: "KENSTER")

      visit ideas_path
      click_link_or_button "Edit"
      fill_in "idea[name]", with: "Learn to code"
      fill_in "idea[description]", with: "ASAP"
      click_link_or_button "Update"

      expect(page).to have_content("Learn to code")
      expect(page).to_not have_content("KENSTER")
    end

  end 
end