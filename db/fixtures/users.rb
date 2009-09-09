User.seed(:email) do |u|
  u.email = "bob@example.org"
  u.first_name = "Bob"
  u.last_name = "Bobson"
  u.address = "111 Fake Street, Boston, Massachusetts"
  u.home_phone = "(111) 222-3333"
  u.cell_phone = "(111) 333-4444"
  u.password = u.password_confirmation = "secret"
end

User.seed(:email) do |u|
  u.email = "admin@example.org"
  u.first_name = "Jake"
  u.last_name = "Philburtinton"
  u.address = "222 Nice Street, Boston, Massachusetts"
  u.home_phone = "(222) 444-7777"
  u.cell_phone = "(222) 555-6666"
  u.password = u.password_confirmation = "secret"
end
User.find_by_email("admin@example.org").has_role!(:admin)

User.seed(:email) do |u|
  u.email = "president@example.org"
  u.first_name = "Henry"
  u.last_name = "Jakobi"
  u.address = "445 Sublime Ave., New York, New York"
  u.home_phone = "(555) 555-5555"
  u.cell_phone = "(555) 666-6666"
  u.password = u.password_confirmation = "secret"
  u.position = Position.find_or_create_by_title("President")
end
