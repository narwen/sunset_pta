class Notifier < ActionMailer::Base

  default_url_options[:host] = "sunset-pta.heroku.com"

  def signup_invitation(user)
    content_type "text/html"    
    subject       "You've been invited to Sunset PTA!"
    from          "noreply@sunset-pta.heroku.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "noreply@sunset-pta.heroku.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
    body          :user => user
  end

end
