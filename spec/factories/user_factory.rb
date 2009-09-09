Factory.define(:user) do |u|
  u.sequence(:email) {|n| "user#{n}@example.com" }
  u.first_name "Bob"
  u.last_name "Johnson"
  u.address "123 Hello St."
  u.cell_phone "22 33 44 55"
  u.home_phone "33 44 55 33"
  # u.password "secret"
  # u.password_confirmation "secret"
end
