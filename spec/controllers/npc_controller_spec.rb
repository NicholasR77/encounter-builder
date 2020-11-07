require 'rails_helper'

RSpec.describe NpcsController, type: :controller do
  describe 'handles the management of NPCs' do
    before do
      @npc = FactoryBot.build(:npc)
      @npc_params = FactoryBot.attributes_for(:npc)
    end

    describe '#index' do
    
    end

    describe '#show' do
    
    end

    describe '#new' do
    
    end

    describe '#create' do
    
    end

    describe '#delete' do
    
    end
  end
end