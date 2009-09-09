Given /^there is a committee "([^\"]*)"$/ do |name|
  Factory(:committee, :name => name)
end
