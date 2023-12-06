FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    profile { create(:profile, user: instance) }
  end
end
