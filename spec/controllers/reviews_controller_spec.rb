require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  describe "GET #index" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @client = FactoryBot.create(:client)
      end
      
      it "responds successfully" do
        sign_in @user
        get :index, params: { client_id: @client.id, user_id: @user.id }
        expect(response).to be_successful
      end
    end
  end
end
