FactoryBot.define do
  factory :post do
    content { Faker::Lorem.paragraph }
    author { create(:user) }
  end
end
