class Favorite < ActiveRecord::Base
  attr_accessible :giver_id, :palette_id
  
  belongs_to :palette
  belongs_to(
    :giver,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :giver_id
  )
end
