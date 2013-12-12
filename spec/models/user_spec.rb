require 'spec_helper'

describe User do

  describe "email" do
    it "validates presence of email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end
  
    it "validates format of email" do
      expect(FactoryGirl.build(:user, email: "notvalid")).not_to be_valid
    end
  end
     
  describe "username" do 
    it "validates presence of username" do
      expect(FactoryGirl.build(:user, username: nil
        )).to have_at_least(1).error_on(:username)
    end
  end
    
  describe "password" do
    it "validates password presence" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end
     
    it "validates password length (min. 8 chars)" do
      expect(FactoryGirl.build(:user, password: "ilu").errors_on(:password
        )).to include("is too short (minimum is 8 characters)")
    end
  end

  describe "associations" do
    it { should have_many(:palettes) }
    it { should have_many(:authentications) }
    it { should have_many(:favorites) }
    it { should have_many(:favorite_palettes) }
  end
end