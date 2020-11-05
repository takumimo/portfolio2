FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    text { Faker::Lorem.characters(number: 50) }
    user
  end
end
