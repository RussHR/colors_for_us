require 'spec_helper'

describe Favorite do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @palette = FactoryGirl.create(:palette)
  end
  
  describe "validations" do
    it "validates presence of giver_id" do
      expect(Favorite.new(palette_id: @palette.id)).not_to be_valid
    end
    
    it "validates presence of palette_id" do
      expect(Favorite.new(giver_id: @user.id)).not_to be_valid
    end
    
    it "validates uniqueness of a giver_id and palette_id pair" do
      favorite1 = Favorite.create(palette_id: @palette.id, giver_id: @user.id)
      expect(Favorite.new(palette_id: @palette.id, giver_id: @user.id
        )).not_to be_valid
    end
  end
  
  describe "associations" do
    it { should belong_to(:palette) }
    it { should belong_to(:giver) }
  end
end