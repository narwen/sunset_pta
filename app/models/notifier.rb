class Notifier < ActionMailer::Base

  default_url_options[:host] = "sunsetptatest.org"

  def signup_invitation(user)
    recipients "#{user.full_name} <#{user.email}>"
    from       "Sunset PTA "
    subject    "You've been invited to Sunset PTA!"
    sent_on    Time.now
    content_type "text/html"
    # body       { :user => user, :url => activate_url(user.activation_code, :host => user.site.host }
    body[:user]  = user
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@sunsetptatest.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "Binary Logic Notifier <noreply@binarylogic.com>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

end
