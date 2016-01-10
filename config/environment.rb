# Load the Rails application.
require File.expand_path('../application', __FILE__)
ActionMailer::Base.smtp_settings = {
  :user_name => 'phani8996@gmail.com',
  :password => 'n^<Lh=8Uy96',
  :domain => 'gmail.com',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain
  #:enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
