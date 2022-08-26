FactoryBot.define do
  factory :publisher do
    name{Faker::Book.title}
    description{Faker::Lorem.sentence(word_count: 20)}
  end
end
