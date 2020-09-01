FactoryBot.define do
  factory :product do
    store { nil }
    name { "MyString" }
    description { "MyText" }
    featured_image { "MyString" }
    slug { "MyString" }
    price_in_cents { "" }
  end
end
