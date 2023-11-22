FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    post { create(:post) }
    user { create(:user) }
  end
end
