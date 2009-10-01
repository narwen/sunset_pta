Then /^I should see that "([^\"]*)" is an admin$/ do |user_name|
=begin
  # response.should have_selector('tr') do |row|
  #   row.should have_selector('td', :content => user_name)
  #   row.should have_selector('td', :content => 'X')
  # end
  response.should have_selector("tr:contains(\"#{user_name}\") > td", :content => 'X')
  (chris) i set this to pending since I don't know how to test for an image being the content of something :)
=end

  pending
end

Then /^I should see that "([^\"]*)" is not an admin$/ do |user_name|
=begin  
  response.should_not have_selector("tr:contains(\"#{user_name}\") > td", :content => 'X')
=end
  pending
end
