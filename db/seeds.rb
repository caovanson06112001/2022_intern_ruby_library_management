User.create!(name: "caoson",
  email: "caovanson@sun-asterisk.com",
  password: "123123",
  password_confirmation: "123123",
  phone_number: "0338910238",
  admin: true)

59.times do |n|
  Publisher.create!(
    name: Faker::Book.title,
    description: Faker::Lorem.sentence(word_count: 20),
  )
end

39.times do |n|
password = "123123"
User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: password,
  password_confirmation: password,
  description: Faker::Lorem.sentence(word_count: 20),
  phone_number: Faker::PhoneNumber.phone_number,
)
end

39.times do |n|
  Category.create!(name: "sach - #{n+1}")
  name = "sach - #{n+1}"
end

40.times do |n|
  name = "Nguyen Van A#{n+1}"
  description = "Vui tinh, Hoa dong, yeu thien nhien"
  dob = Date.new(2000, 04, 18)
  gender = 1
  Author.create!(name: name,
    description: description,
    dob: dob,
    gender: gender,
  )
end

4.times do |n|
  day_start = Date.new(2000, 04, 18)
  Order.create!(
    day_start: day_start,
    user_id: n+1,
  )
end

4.times do |n|
  date_end = Date.new(2000, 04, 18)
  OrderDetail.create!(
    date_end: date_end,
    book_id: 3,
    order_id: 1,
    quantity: 123,
    status: :approved
  )
end
