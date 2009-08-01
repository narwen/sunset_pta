Given /^there exists a position "([^\"]*)"$/ do |title|
  Factory(:position, :title => title)
end
