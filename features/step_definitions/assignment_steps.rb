Given /^"([^\"]*)" is assigned to "([^\"]*)" as "([^\"]*)"$/ do |email, committee, duty|
  Factory(:assignment, :user_id => User.find_by_email(email).id,
                  :committee_id => Committee.find_by_name(committee).id,
                  :duty_id => Duty.find_by_name(duty).id)
end

