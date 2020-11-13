require 'rails_helper'

RSpec.describe Npc, type: :model do
  before do
    @npc = FactoryBot.build(:npc)
  end

  it 'is valid with valid attributes' do
    expect(@npc).to be_valid
  end
end