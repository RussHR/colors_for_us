class UserMailer < ActionMailer::Base
  default from: "theguys@colorsfor.us"
  
  def welcome_email(user)
    @user = user
    
    mail(
      to: user.email,
      subject: "Welcome to colorsfor.us!"
    )
  end
end