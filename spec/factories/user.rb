FactoryBot.define do
  factory :user do
    name{Faker::Name.first_name}
    email{Faker::Internet.email.downcase}
    password{"123123"}
    password_confirmation{"123123"}
    role{1}
  end
end
