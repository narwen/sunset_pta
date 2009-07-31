Given /^I am registered user "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  params = {
    "login" => login,
    "password" => password,
    "password_confirmation" => password,
    "email" => "anything@something.com"
  }
  @user = User.create!(params)
end

Given /^There is no registered user "([^\"]*)" with password "([^\"]*)"$/ do |arg1, arg2|
  # nothing to do here, since don't want a user
end
