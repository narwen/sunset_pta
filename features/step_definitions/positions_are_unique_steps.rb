Given /^there already exists a position with title "([^\"]*)"$/ do |title|
  Position.create!(:title => title)
end
