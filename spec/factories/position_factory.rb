Factory.define(:position) do |p|
  p.sequence(:title) {|n| "Position ##{n}" }
end
