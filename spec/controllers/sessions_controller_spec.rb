require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'it handles user session management' do
    before do
      @user = FactoryBot.build(:user)
      @user_params = { email: @user.email, password: @user.password }
    end

    describe '#new' do
      it 'displays the login page' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      it 'logs you in with valid credentials' do
        post :create, params: @user_params
        expect(session[:user_id]).to equal(@user.id)
      end

      it 'does not log you in with invalid credentials' do
        post :create, params: @user_params
      end
    end

    describe '#destroy' do
      it 'logs you out of the systen' do
        post :destroy
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
