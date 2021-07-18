require 'rails_helper'

RSpec.describe "Clients", type: :request do
  
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  
  describe 'GET #index' do
    it 'responds successfully' do
      @client = FactoryBot.create(:client)
      get client_reviews_path(@client)
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end
  
  describe 'POST #create and #update' do
    context 'If the parameters are valid' do
      it 'Successful request' do
        @client = FactoryBot.create(:client)
        post client_reviews_path(@client), params: { review: FactoryBot.attributes_for(:review) }
        expect(response.status).to eq 200
      end
    end
  end
end
