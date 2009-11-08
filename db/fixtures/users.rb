require 'password'
User.seed(:email) do |u|
  u.email = "bob@example.org"
  u.first_name = "Bob"
  u.last_name = "Bobson"
  u.password = u.password_confirmation = Password.fetch_secret_password
  u.active = true
end

User.seed(:email) do |u|
  u.email = "admin@example.org"
  u.first_name = "Jake"
  u.last_name = "Philby"
  u.password = u.password_confirmation = Password.fetch_secret_password
  u.active = true
end

User.find_by_email("admin@example.org").has_role!(:admin)

User.seed(:email) do |u|
  u.email = "president@example.org"
  u.first_name = "Henry"
  u.last_name = "Jakobi"
  u.password = u.password_confirmation = Password.fetch_secret_password
  u.position = Position.find_or_create_by_title("President")
  u.active = true
end
