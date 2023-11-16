FactoryBot.define do
  factory :friend_request do
    user { create(:user) }
    sender { create(:user) }
    receiver { create(:user) }
  end
end
