require 'rails_helper'

RSpec.describe EncountersController, type: :controller do
  describe 'handles the management of encounter' do
    before do
      @encounter = FactoryBot.create(:encounter)
      @encounter_params = FactoryBot.attributes_for(:encounter)
    end

    def create_encounter
      post :create, params: { encounter: @encounter_params }
    end

    def show_encounter
      get :show, params: { id: @encounter.id  }
    end

    def delete_encounter
      delete :destroy, params: { id: @encounter.id }
    end

    describe '#index' do
      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe '#show' do
      it 'returns a successful response' do
        show_encounter
        expect(response).to have_http_status(:ok)
      end

      it 'renders the show template' do
        show_encounter
        expect(response).to render_template(:show)
      end
    end

    describe '#new' do
      it 'returns a successful response' do
        get :new
        expect(response).to have_http_status(:ok)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      it 'creates a new encounter' do
        expect{ create_encounter }.to change(Encounter.all, :count).by(1)
      end

      it 'returns a 302 response' do
        create_encounter
        expect(response).to have_http_status(:found)
      end

      it 'redirects to the show page' do
        create_encounter
        expect(response).to redirect_to encounter_path(Encounter.last)
      end
    end

    describe '#delete' do
      it 'deletes the encounter' do
        expect{ delete_encounter }. to change(Encounter.all, :count).by(-1)
      end

      it 'redirects to the index page' do
        delete_encounter
        expect(response).to redirect_to encounters_path
      end
    end
  end
end
