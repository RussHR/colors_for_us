class Palette < ActiveRecord::Base
  attr_accessible :color_1, :color_2, :color_3, :color_4, :color_5,
                  :creator_id, :name
  
  validates :color_1, :creator_id, :name, presence: true
  
  belongs_to(
    :creator,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :creator_id
  )
  
  has_many :favorites
  
  has_many :favoriting_users, :through => :favorites, :source => :giver
  
  def real_colors
    [].tap do |actual_colors|
      self.colors.each do |color|
        actual_colors << color unless color.nil?
      end
    end
  end
  
  def colors
    [self.color_1, self.color_2, self.color_3, self.color_4, self.color_5]
  end
  
  def num_of_colors
    self.real_colors.length
  end
end
