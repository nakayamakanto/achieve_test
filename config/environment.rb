# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#action_mailer_settings
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address        => ENV['MY_SERVER_ADDRESS'],
  :port           => '587',
  :domain         => ENV['MY_SERVER_ADDRESS'],
  :user_name      => ENV['MY_MAIL_ADDRESS'],
  :password       => ENV['MY_MAIL_PASSWORD'],
  :authentication => 'plain',
}
