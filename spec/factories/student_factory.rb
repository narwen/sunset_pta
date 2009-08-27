Factory.define(:student) do |s|
  s.sequence(:name) {|n| "Student ##{n}"}
  s.grade "5"
  s.room "303"
  s.teacher "Joe Joeson"
end
