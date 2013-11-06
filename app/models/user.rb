class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  after_create :send_welcome_email
  
  private
  
  def send_welcome_email
    puts "Calling send_welcome_email"
    msg = UserMailer.welcome_email(self)
    msg.deliver!
  end
end