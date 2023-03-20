FactoryBot.define do
  factory :transfer do
    name { Faker::Name.name[1, 15] }
    amount { Faker::Commerce.price(range: 1..4000) }
    author { user }
    category
  end
end
