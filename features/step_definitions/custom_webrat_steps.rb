When /^I fill in the following fields:$/ do |table|
  table.hashes.each do |hash|
    fill_in hash['field'], :with => hash['value']
  end
end

When /^I save and open page$/ do
  save_and_open_page
end

Then /^I debug$/ do
  breakpoint
  0
end