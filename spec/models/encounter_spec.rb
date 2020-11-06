require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @encounter = FactoryBot.build(:encounter)
  end

  it 'is valid with valid attributes' do
    expect(@encounter).to be_valid
  end
  
  it 'is not valid without a name' do
    @encounter.name = nil
    expect(@encounter).not_to be_valid
  end
end