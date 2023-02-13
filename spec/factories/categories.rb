FactoryBot.define do
  factory :category do
    name { Faker::Name.name[1, 15] }
    icon { Faker::Internet.url }
    user
  end
end
