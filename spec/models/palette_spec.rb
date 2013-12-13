require 'spec_helper'

describe Palette do
  describe "name" do
    it "validates presence of name" do
      expect(FactoryGirl.build(:palette, name: nil)).not_to be_valid
    end
  end
  
  describe "creator_id" do
    it "validates presence of creator_id" do
      expect(FactoryGirl.build(:palette, creator_id: nil)).not_to be_valid
    end
  end
  
  describe "colors" do
    it "validates presence of color_1" do
      expect(FactoryGirl.build(:palette, color_1: nil)).not_to be_valid
    end
    
    it "allows other colors to be nil" do
      expect(FactoryGirl.build(:palette, color_2: nil, color_4: nil
        )).to be_valid
    end
  end
  
  describe "instance methods" do
    it "returns an array of hex colors" do
      palette = FactoryGirl.build(:palette)
      
      palette.colors.each do |color|
        expect(color.class).to eq(String)
        expect(color[0]).to eq("#")
      end
    end
    
    it "returns an array of real_colors" do
      palette = FactoryGirl.build(:palette, color_2: nil)
      expect(palette.real_colors.length).to eq(4)
      expect(palette.real_colors).not_to include(nil)
    end
    
    it "finds the num_of_colors" do
      palette1 = FactoryGirl.build(:palette)
      palette2 = FactoryGirl.build(:palette, color_2: nil, color_4: nil)
      expect(palette1.num_of_colors).to eq(5)
      expect(palette2.num_of_colors).to eq(3)
    end
  end
  
  describe "associations" do
    it { should belong_to(:creator) }
    it { should have_many(:favorites) }
    it { should have_many(:favoriting_users) }
  end
end