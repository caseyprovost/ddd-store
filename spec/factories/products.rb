FactoryBot.define do
  factory :product do
    association :store
    name { Faker::Book.unique.title }
    description { Faker::Lorem.paragraphs(number: 3) }
    featured_image { nil }
    price_in_cents { Faker::Number.number(digits: (3..12).to_a.sample) }
  end
end
