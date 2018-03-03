# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path("../app_config.yml", __FILE__))))

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'weekly-team-planner.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}