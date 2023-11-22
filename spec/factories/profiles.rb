FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday }
    user { create(:user) }
  end
end
