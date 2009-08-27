Given /^there is a user "([^\"]*)"$/ do |email|
  Factory(:user, :email => email)
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
