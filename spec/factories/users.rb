FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username }
    name { Faker::Name.unique.name }
    password { "google123" }
  end
end
