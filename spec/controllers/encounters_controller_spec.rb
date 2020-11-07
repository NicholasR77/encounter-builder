require 'rails_helper'

RSpec.describe EncountersController, type: :controller do
  describe 'handles the management of encounter' do
    before do
      @encounter = FactoryBot.build(:encounter)
      @encounter_params = FactoryBot.attributes_for(:encounter)
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
