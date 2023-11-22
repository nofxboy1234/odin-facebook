FactoryBot.define do
  factory :like do
    post { create(:post) }
    user { create(:user) }
  end
end
