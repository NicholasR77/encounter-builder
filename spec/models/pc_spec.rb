require 'rails_helper'

RSpec.describe Pc, type: :model do
  before do
    @pc = FactoryBot.build(:pc)
  end

  it 'is valid with valid attributes' do
    expect(@pc).to be_valid
  end
end