require 'spec_helper'

describe User do
  it "validates presence of email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end
  
  it "validates format of email" do
    expect(User.new(
            email: "fake",
            username: "ned",
            password: "ireallylovecats")).not_to be_valid
  end
    
  it "validates presence of username" do
    expect(User.new(
            email: "totally_valid_email@example.com",
            password: "ireallylovecats"
           )).to have_at_least(1).error_on(:username)
  end
    
  it "validates password presence" do
    expect(User.new(
            email: "totally_valid_email@example.com",
            username: "ned")).not_to be_valid
  end
     
  it "validates password length (min. 8 chars)" do
    short_pass_user = User.new(
                        email: "totally_valid_email@example.com",
                        username: "ned",
                        password: "ilu")
    expect(short_pass_user.errors_on(:password)).to include(
      "is too short (minimum is 8 characters)")
  end
  
  it { should have_many(:palettes) }
  it { should have_many(:authentications) }
  it { should have_many(:favorites) }
  it { should have_many(:favorite_palettes) }
end