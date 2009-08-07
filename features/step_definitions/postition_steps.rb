Given /^there is a position "([^\"]*)"$/ do |title|
  Factory(:position, :title => title)
end

Given /^"([^\"]*)" has the position "([^\"]*)"$/ do |email, position_title|
  position = Position.find_by_title(position_title) || Factory(:position, :title => position_title)
  user = User.find_by_email(email) || Factory(:user, :email => email)
  user.position = position
  user.save
end
