FactoryBot.define do
  factory :store do
    name { Faker::Company.unique.name }
    subdomain { Faker::Internet.unique.domain_word }
    association :owner, factory: :user
  end
end
