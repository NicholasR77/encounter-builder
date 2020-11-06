require 'rails_helper'

RSpec.describe Npc, type: :model do
  before do
    @npc = FactoryBot.build(:npc)
  end

  it 'is valid with valid attributes' do
    expect(@npc).to be_valid
  end
  
  it 'is not valid without a name' do
    @npc.name = nil
    expect(@npc).not_to be_valid
  end
end