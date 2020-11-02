require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'it handles user management' do
    before do
      @user = FactoryBot.build(:user)
      @user_params = FactoryBot.attributes_for(:user)
    end

    describe '#new' do
      it 'returns a succesful response' do
        get :new
        expect(response).to have_http_status(:ok)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      it 'creates a new user' do
        expect { post :create, params: { user: @user_params } }.to change(User.all, :count).by(1)
      end

      it 'returns a 302 response' do
        post :create, params: { user: @user_params }
        expect(response).to have_http_status(:found)
      end

      it 'redirects to the login page' do
        post :create, params: { user: @user_params }
        expect(response).to redirect_to login_path
      end
    end
  end
end
