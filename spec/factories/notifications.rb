FactoryBot.define do
  factory :notification do
    user { create(:user) }
  end
end
