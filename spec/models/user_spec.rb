require 'rails_helper'

RSpec.describe User, type: :model do
  let(:kenny) do
    User.new(username: "Kenny")
  end

  it 'has ideas' do
    expect(kenny).to respond_to(:ideas)
  end

  it 'fails to validate' do
    kenny.username = nil
    expect(kenny).to_not be_valid
  end
end
