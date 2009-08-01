Given /^I am registered user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  params = {
    "email" => email,
    "password" => password,
    "password_confirmation" => password
  }
  @user = User.create!(params)
end

Given /^there is no registered user "([^\"]*)" with password "([^\"]*)"$/ do |arg1, arg2|
  # nothing to do here, since don't want a user
end
