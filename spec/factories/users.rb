FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    username Faker::Internet.user_name
    password "ireallylovecats"
  end
end