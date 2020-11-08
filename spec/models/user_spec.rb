require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).not_to be_valid
  end

  it 'only allows unique emails' do
    FactoryBot.create(:user, email: 'test2@test.com')
    user = FactoryBot.build(:user, email: 'test2@test.com')
    expect(user).not_to be_valid
  end

  it 'returns the full name as a string' do
    expect(@user.full_name).to eq('Test Testerson')
  end
end
