Then /^I should see that "([^\"]*)" is an admin$/ do |user_name|
  # response.should have_selector('tr') do |row|
  #   row.should have_selector('td', :content => user_name)
  #   row.should have_selector('td', :content => 'X')
  # end
  response.should have_selector("tr:contains(\"#{user_name}\") > td", :content => 'X')
end

Then /^I should see that "([^\"]*)" is not an admin$/ do |user_name|
  response.should_not have_selector("tr:contains(\"#{user_name}\") > td", :content => 'X')
end