require 'rails-helper'

Rspec.describe PcsController, type: controller do
  describe 'handles the management of PCs' do
    before do
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