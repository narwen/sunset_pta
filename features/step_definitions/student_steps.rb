Given /^I am the parent of student "([^\"]*)"$/ do |student_name|
  student = current_user.students.find_by_name(student_name)
  if student.nil?
    student = Factory(:student, :name => student_name)
    current_user.students << student
    current_user.save
  end	
end

When /^I click "([^\"]*)" for "([^\"]*)"$/ do |link, student_name|
  student = current_user.students.find_by_name(student_name)
  if not student.nil?
    within("table > tr#student_#{student.id}") do
      click_link link
    end
  end
end