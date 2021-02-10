FactoryBot.define do
    factory :postcomment do
      text { Faker::Lorem.characters(number: 10) }
      
    end
  end