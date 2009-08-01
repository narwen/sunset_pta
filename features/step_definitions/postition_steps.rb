Given /^there exists a position "([^\"]*)"$/ do |title|
  Position.create!(:title => title)
end
