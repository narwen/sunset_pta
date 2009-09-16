Factory.define(:duty) do |c|
  c.sequence(:name) {|n| "Duty ##{n}" }
end
