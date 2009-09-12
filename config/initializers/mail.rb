require 'smtp-tls'

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => "587",
  :authentication => :plain,
  :user_name      => ENV['GMAIL_EMAIL'],
  :password       => ENV['GMAIL_PASSWORD']
}

DO_NOT_REPLY ||= "donotreply@noreply.com"

