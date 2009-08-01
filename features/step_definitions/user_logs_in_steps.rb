Given /^I am registered user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  params = {
    "email" => email,
    "password" => password,
    "password_confirmation" => password
  }
  @user = User.create!(params)
end

Given /^I am logged in as "([^\"]*)"$/ do |email|
  @user = Factory(:user, :email => email)
  When %(I go to the login page)
  And %(I fill in "Email" with "#{@user.email}")
  And %(I fill in "Password" with "#{@user.password}")
  And %(I press "Login")
  current_user.should_not be_nil
end

Given /^there is no registered user "([^\"]*)" with password "([^\"]*)"$/ do |arg1, arg2|
  # nothing to do here, since don't want a user
end
