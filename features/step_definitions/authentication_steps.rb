Given /^I am logged in as "([^\"]*)"$/ do |email|
  user = Factory(:user, :email => email)
  When %(I go to the login page)
  And %(I fill in "Email" with "#{user.email}")
  And %(I fill in "Password" with "#{user.password}")
  And %(I press "Login")
  current_user.should_not be_nil
end
