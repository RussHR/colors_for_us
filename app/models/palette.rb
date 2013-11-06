class Palette < ActiveRecord::Base
  attr_accessible :color_1, :color_2, :color_3, :color_4, :color_5, :creator_id
  
  validates :color_1, :creator_id, presence: true
  
  belongs_to(
    :creator,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :creator_id
  )
end
