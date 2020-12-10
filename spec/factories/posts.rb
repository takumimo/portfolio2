FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    text { Faker::Lorem.characters(number: 50) }
    emoji { Faker::Lorem.characters(number: 1) }
    tag_list { Faker::Lorem.characters(number: 5) }
    user
  end
end
