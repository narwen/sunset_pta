Given /^I am logged in as "([^\"]*)"$/ do |email|
  user = Factory(:user, :email => email)
  When %(I go to the login page)
  And %(I fill in "Email" with "#{user.email}")
  And %(I fill in "Password" with "#{user.password}")
  And %(I press "Login")
  current_user.should_not be_nil
end

When /^I log in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  When %(I go to the login page)
  And %(I fill in "Email" with "#{email}")
  And %(I fill in "Password" with "#{password}")
  And %(I press "Login")
  current_user.should_not be_nil
end

Given /^I am not logged in$/ do
  current_user = nil
end