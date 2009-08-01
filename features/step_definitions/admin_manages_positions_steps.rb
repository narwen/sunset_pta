Given /^I am logged in as registered user "([^\"]*)"$/ do |email|
  params = {
    "email" => email,
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  @user = User.create!(params)
end

Given /^I have the role "([^\"]*)"$/ do |role|
  @user.has_role? role.to_sym
end