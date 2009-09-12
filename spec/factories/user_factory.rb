Factory.define(:user) do |u|
  u.sequence(:email) {|n| "user#{n}@example.com" }
  u.first_name "Bob"
  u.last_name "Johnson"
  u.password "secret"
  u.password_confirmation "secret"
end
