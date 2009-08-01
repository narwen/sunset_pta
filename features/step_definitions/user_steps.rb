Given /^a user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Factory(:user,
    :email => email,
    :password => password,
    :password_confirmation => password
  )
end

Given /^there is no user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  # nothing to do here, since don't want a user
end
