require 'rails_helper'

RSpec.describe Review, type: :model do
  
  describe Review do
    it "should belongs to user" do
      t = Review.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    
    it "should belongs to client" do
      t = Review.reflect_on_association(:client)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
