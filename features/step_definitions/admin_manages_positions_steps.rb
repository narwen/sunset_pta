Given /^I am logged in as registered user "([^\"]*)"$/ do |login|
  params = {
    "login" => login,
    "password" => "secret",
    "password_confirmation" => "secret",
    "email" => "anything@something.com"
  }
  @user = User.create!(params)
end

Given /^I have the role "([^\"]*)"$/ do |role|
  @user.has_role? role.to_sym
end