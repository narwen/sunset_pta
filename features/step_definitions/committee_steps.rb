Given /^there is a committee "([^\"]*)"$/ do |committee_name|
  Factory(:committee, :name => committee_name)
end
