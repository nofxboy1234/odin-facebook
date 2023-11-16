FactoryBot.define do
  factory :friend_request do
    user { create(:user) }
    friendship { create(:friendship) }
    sender { create(:user) }
  end
end
