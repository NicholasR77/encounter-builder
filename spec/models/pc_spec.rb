require 'rails_helper'

RSpec.describe Pc, type: :model do
  before do
    @pc = FactoryBot.build(:pc)
  end

  it 'is valid with valid attributes' do
    expect(@pc).to be_valid
  end
  
  it 'is not valid without a name' do
    @npc.name = nil
    expect(@pc).not_to be_valid
  end
end