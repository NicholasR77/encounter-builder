require 'rails_helper'

RSpec.describe PcsController, type: :controller do
  describe 'handles the management of PCs' do
    before do
      allow(controller).to receive(:logged_in_user).and_return(true)
      @pc = FactoryBot.build(:pc)
      @pc_parmas = FactoryBot.attributes_for(:pc)
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