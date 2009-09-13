Given /^I am the parent of student "([^\"]*)"$/ do |student_name|
  student = current_user.students.find_by_name(student_name)
  if student.nil?
    student = Factory(:student, :name => student_name)
    current_user.students << student
    current_user.save
  end	
end

Given /^there is a user "([^\"]*)" named "([^\"]*)" with student "([^\"]*)"$/ do |user_email, user_name, student_name|
  words = user_name.split(" ")
  first_name = words[0]
  last_name = words[1]
  user = Factory(:user, :email => user_email, :first_name => first_name, :last_name => last_name)
  student = Factory(:student, :name => student_name)
  user.students << student
  user.save
end

Given /^there is a user "([^\"]*)" named "([^\"]*)"$/ do |user_email, user_name|
  words = user_name.split(" ")
  first_name = words[0]
  last_name = words[1]
  user = Factory(:user, :email => user_email, :first_name => first_name, :last_name => last_name)
end
