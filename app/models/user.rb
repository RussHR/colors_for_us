class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username
                  
  validates :username, :uniqueness => true, :presence => true

  after_create :send_welcome_email
  
  has_many :authentications
  has_many(
    :palettes,
    :class_name => "Palette",
    :primary_key => :id,
    :foreign_key => :creator_id
  )
  has_many(
    :favorites,
    :class_name => "Favorite",
    :primary_key => :id,
    :foreign_key => :giver_id
  )
  
  has_many :favorite_palettes, :through => :favorites, :source => :palette
  
  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    authentications.build(provider: omniauth['provider'], uid: omniauth['uid'])
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  private
  
  def send_welcome_email
    msg = UserMailer.welcome_email(self) unless Rails.env == "test"
  end
end