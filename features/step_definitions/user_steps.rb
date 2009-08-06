Given /^there is a user "([^\"]*)"$/ do |email|
  Factory(:user, :email => email)
end

Given /^there are users ((?:"[^\"]*",? ?)+)$/ do |quoted_emails|
  quoted_strings(quoted_emails).each do |email|
    user = Factory(:user, :email => email)
  end
end

Given /^there is a user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Factory(:user,
    :email => email,
    :password => password,
    :password_confirmation => password
  )
end

Given /^there is no user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  # nothing to do here, since don't want a user
end
