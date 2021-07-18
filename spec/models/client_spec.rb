require 'rails_helper'

RSpec.describe Client, type: :model do
  
  describe Client do
    it "should have many reviews" do
      t = Client.reflect_on_association(:reviews)
      expect(t.macro).to eq(:has_many)
    end
    
    it "has a valid factory" do
      expect(FactoryBot.build(:client)).to be_valid
    end
    
    it "is invalid without a company" do
      client = FactoryBot.build(:client, company: nil)
      client.valid?
      expect(client.errors[:company]).to include("を入力してください")
    end
    
    it "is invalid without a name" do
      client = FactoryBot.build(:client, name: nil)
      client.valid?
      expect(client.errors[:name]).to include("を入力してください")
    end
    
    it "is invalid without a phonenumber" do
      client = FactoryBot.build(:client, phonenumber: nil)
      client.valid?
      expect(client.errors[:phonenumber]).to include("を入力してください")
    end
    
    it "is invalid without a email" do
      client = FactoryBot.build(:client, email: nil)
      client.valid?
      expect(client.errors[:email]).to include("を入力してください")
    end
  end
end
