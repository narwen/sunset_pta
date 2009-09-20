Given /^there is a user "([^\"]*)"$/ do |email|
  Factory(:user, :email => email)
end

Given /^"([^\"]*)" is inactive$/ do |email|
  u = User.find_by_email(email)
  u.active = false
  u.save
end

Given /^there are users ((?:"[^\"]*",? ?)+)$/ do |quoted_emails|
  quoted_strings(quoted_emails).each do |email|
    user = Factory(:user, :email => email)
  end
end

Given /^the following users exist:$/ do |table|
  table.hashes.each do |hash|
    if position_title = hash['position_title']
      position = Factory(:position, :title => position_title)
      hash = hash.merge(:position_id => position.id)
    end

    Factory(:user, hash.reject { |k,v| k.to_s == 'position_title' })
  end
end

Given /^there is a user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Factory(:user,
    :email => email,
    :password => password,
    :password_confirmation => password
  )
end

Given /^there is no user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  # nothing to do here, since don't want a user
end

Given /^there is a user "([^\"]*)" with name "([^\"]*)"$/ do |email, fullname|
    name = fullname.split(/\s+/)
    Factory(:user,
      :email => email,
      :first_name => name[0],
      :last_name => name[1])
end

Given /^my name is "([^\"]*)"$/ do |fullname|
  name = fullname.split(/\s+/)
  current_user.first_name = name[0]
  current_user.last_name = name[1]
  current_user.save
end