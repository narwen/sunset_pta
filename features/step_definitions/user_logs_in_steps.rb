Given /^I am registered user "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  params = {
    "login" => login,
    "password" => password,
    "password_confirmation" => password,
    "email" => "anything@something.com"
  }
  @user = User.create!(params)
end
