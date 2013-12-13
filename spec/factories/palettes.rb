def hex_color_generator
  color = "#"
  hex_chars = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
               "A", "B", "C", "D", "E", "F"]
  
  6.times do
    color << hex_chars.sample
  end
  
  color
end

FactoryGirl.define do
  factory :palette do
    name Faker::Address.city
    creator_id 1
    color_1 hex_color_generator
    color_2 hex_color_generator
    color_3 hex_color_generator
    color_4 hex_color_generator
    color_5 hex_color_generator
  end
end