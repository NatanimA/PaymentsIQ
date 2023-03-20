FactoryBot.define do
  factory :user do
    name { Faker::Name.name[1, 15] }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
