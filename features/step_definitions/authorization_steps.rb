Given /^I have the role "([^\"]*)"$/ do |role|
  current_user.has_role! role.to_sym
end

Given /^I do not have the role "([^\"]*)"$/ do |role|
  current_user.has_no_role! role.to_sym
end
