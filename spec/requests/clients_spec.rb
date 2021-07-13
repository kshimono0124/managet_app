require 'rails_helper'

RSpec.describe "Clients", type: :request do
  
  describe 'GET #index' do
    it 'responds successfully' do
      get clients_path
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end
  
  describe 'GET #show' do
    context 'If the user exists' do
      let(:client) { FactoryBot.create :client }
      
      it 'show client' do
        get client_url client.id
        expect(response.status).to eq 200
        expect(response.body).to include 'client'
      end
    end
    
    context 'If the user does not exist' do
      subject { -> { get client_url 1 } }
  
      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end
  
  describe 'GET #new' do
    it 'responds successfully' do
      get new_client_url
      expect(response.status).to eq 200
    end
  end
  
  describe 'GET #edit' do
    let(:client) { FactoryBot.create :client }

    it 'responds successfully' do
      get edit_client_url client
      expect(response.status).to eq 200
    end

    it 'show client company' do
      get edit_client_url client
      expect(response.body).to include 'test株式会社'
    end
    
    it 'show client name' do
      get edit_client_url client
      expect(response.body).to include 'test部長'
    end
    
    it 'show client phonenumber' do
      get edit_client_url client
      expect(response.body).to include '000-9999-0000'
    end

    it 'show client email' do
      get edit_client_url client
      expect(response.body).to include 'test-butyo@example.com'
    end
  end
  
  describe 'POST #create and #update' do
    context 'If the parameters are valid' do
      it 'Successful request' do
        post clients_url, params: { client: FactoryBot.attributes_for(:client) }
        expect(response.status).to eq 302
      end

      it 'The user must be registered' do
        expect do
          post clients_url, params: { client: FactoryBot.attributes_for(:client) }
        end.to change(Client, :count).by(1)
      end

      it 'Redirecting' do
        post clients_url, params: { client: FactoryBot.attributes_for(:client) }
        expect(response).to redirect_to User.last
      end
    end
  end
  
  describe 'DELETE #destroy' do
    let!(:client) { FactoryBot.create :client }

    it 'Successful request' do
      delete client_url client
      expect(response.status).to eq 302
    end

    it 'The client is deleted' do
      expect do
        delete client_url client
      end.to change(Client, :count).by(-1)
    end

    it 'Redirect to client list' do
      delete client_url client
      expect(response).to redirect_to(clients_url)
    end
  end
end
