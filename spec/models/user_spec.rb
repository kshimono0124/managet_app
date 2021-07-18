require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe User do
    it "should have many reviews" do
      t = User.reflect_on_association(:reviews)
      expect(t.macro).to eq(:has_many)
    end
    
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    
    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "is invalid without an password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end
