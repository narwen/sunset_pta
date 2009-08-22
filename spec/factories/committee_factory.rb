Factory.define(:committee) do |c|
  c.sequence(:name) {|n| "Committee ##{n}" }
end
