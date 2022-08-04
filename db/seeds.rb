User.create!(name: "caoson",
  email: "caovanson@sun-asterisk.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true)

99.times do |n|
name = "aa"
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password,
)
end
