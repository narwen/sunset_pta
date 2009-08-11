Given /^there is a position "([^\"]*)"$/ do |title|
  Factory(:position, :title => title)
end

Given /^"([^\"]*)" has the position "([^\"]*)"$/ do |email, position_title|
  position = Position.find_by_title(position_title) || Factory(:position, :title => position_title)
  user = User.find_by_email(email) || Factory(:user, :email => email)
  user.position = position
  user.save
end

Given /^I have the position "([^\"]*)"$/ do |position_title|
  Given %("#{current_user.email}" has the position "#{position_title}")
end

Given /^I see "([^\"]*)"$/ do |text|
  response.should contain(text)
end
