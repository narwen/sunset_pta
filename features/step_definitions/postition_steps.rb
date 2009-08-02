Given /^there is a position "([^\"]*)"$/ do |title|
  Factory(:position, :title => title)
end
