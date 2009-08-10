User.seed(:email) do |u|
  u.email = "bob@example.org"
  u.name = "Bob Bobson"
  u.password = u.password_confirmation = "secret"
end

User.seed(:email) do |u|
  u.email = "admin@example.org"
  u.password = u.password_confirmation = "secret"
end
User.find_by_email("admin@example.org").has_role!(:admin)

User.seed(:email) do |u|
  u.email = "president@example.org"
  u.password = u.password_confirmation = "secret"
  u.position = Position.find_or_create_by_title("President")
end
