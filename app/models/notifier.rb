class Notifier < ActionMailer::Base
  def signup_invitation(user)
    recipients "#{user.full_name} <#{user.email}>"
    from       "Sunset PTA "
    subject    "You've been invited to Sunset PTA!"
    sent_on    Time.now
    content_type "text/html"
    # body       { :user => user, :url => activate_url(user.activation_code, :host => user.site.host }
    body[:user]  = user
  end  
end
