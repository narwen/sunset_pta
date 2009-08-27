Given /^the following board_member_contact_infos:$/ do |board_member_contact_infos|
  BoardMemberContactInfo.create!(board_member_contact_infos.hashes)
end

Then /^I should see the following board_member_contact_infos:$/ do |expected_board_member_contact_infos_table|
  expected_board_member_contact_infos_table.diff!(table_at('table').to_a)
end

Given /^the following board members:$/ do |table|
  table.hashes.each do |hash|
    user = Factory(:user, hash)
    !user.position.nil?
  end
end
