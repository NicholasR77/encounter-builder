require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'handles the management of static pages' do
    describe '#home' do
      it 'returns a succesful response' do
        get :home
        expect(response).to have_http_status(:ok)
      end

      it 'renders the home template' do
        get :home
        expect(response).to render_template(:home)
      end
    end
  end
end
