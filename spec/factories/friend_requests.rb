FactoryBot.define do
  factory :friend_request do
    sender { create(:user) }
    receiver { create(:user) }
    notification { create(:notification) }
  end
end
