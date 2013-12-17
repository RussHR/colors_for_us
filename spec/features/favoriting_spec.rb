require 'spec_helper'

Capybara.default_driver = :selenium

describe "the favoriting process", js: true do
  before(:each) do
    # Create a new palette
    @palette = FactoryGirl.create(:palette)
    
    # Create a new user and log in
    visit new_user_session_path
    click_link "Sign up"
    fill_in 'user_username', with: Faker::Internet.user_name
    fill_in 'user_email', with: Faker::Internet.email
    fill_in 'user_password', with: "ireallylovecats"
    fill_in 'user_password_confirmation', with: "ireallylovecats"
    click_button('Sign up')
  end
  
  xit "allows favorites from index" do
  end
end