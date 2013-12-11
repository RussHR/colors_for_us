require 'spec_helper'

describe "User" do
  it "should require a valid email" do
    expect(User.new(
            password: "ireallylovecats", 
            username: "ned")).not_to be_valid
    
    expect(User.new(
            email: "fake",
            username: "ned",
            password: "ireallylovecats")).not_to be_valid
  end
  
  it "should require a username" do
    expect(User.new(
            email: "totally_valid_email@example.com",
            password: "ireallylovecats")).not_to be_valid
  end
  
  it "requires a password of length 6" do
    expect(User.new(
            email: "totally_valid_email@example.com",
            username: "ned")).not_to be_valid
           
    expect(User.new(
            email: "totally_valid_email@example.com",
            username: "ned",
            password: "ilu")).not_to be_valid
  end
end