require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :index
        aggregate_failures do
          expect(response).to be_successful
          expect(response).to have_http_status "200"
        end
      end
    end
  end
  
  describe "#show" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @client = FactoryBot.create(:client)
      end
      
      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @client.id }
        expect(response).to be_successful
      end
    end
  end
  
  describe "#update" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
        @client = FactoryBot.create(:client)
      end
      
      it "adds a client" do
        client_params = FactoryBot.attributes_for(:client, name: "New Client Name")
        sign_in @user
        patch :update, params: { id: @client.id, client: client_params }
        expect(@client.reload.name).to eq "New Client Name"
      end
    end
  end
end
