# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ColorsForUs::Application.initialize!

if Rails.env.production?
  # only send real emails in production using Sendgrid
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
elsif Rails.env.development?
  # use the letter_opener gem to open email in new tab
  ActionMailer::Base.delivery_method = :letter_opener
end