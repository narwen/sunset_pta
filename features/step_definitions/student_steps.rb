Given /^I am the parent of student "([^\"]*)"$/ do |student_name|
  student = current_user.students.find_by_name(student_name)
  if student.nil?
	  student = Factory(:student, :name => student_name)
  	current_user.students << student
  	current_user.save
  end	
end