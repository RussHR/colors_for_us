require 'spec_helper'

describe "the signup process" do

  it "redirects to the new session page when not logged in" do
    visit root_url
    expect(page).to have_content("Sign in")
  end
  
  describe "signing up a user" do
    before(:each) do
      visit new_user_session_url
      click_link "Sign up"
      fill_in 'user_username', with: Faker::Internet.user_name
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: "ireallylovecats"
      fill_in 'user_password_confirmation', with: "ireallylovecats"
      click_button('Sign up')
    end
    
    it "redirects to index/home" do
      expect(page).to have_content("signed up successfully")
      expect(page).to have_content("Sign Out")
    end
  end
end