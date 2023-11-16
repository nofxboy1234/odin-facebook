require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  let!(:sender) do
    create(:user)
  end

  let!(:receiver) do
    create(:user)
  end

  let!(:friend_request) do
    create(:friend_request)
  end

  before do
    sender.send_friend_request(receiver, friend_request)
    receiver.received_friend_requests.first.accept
  end

  context 'when a receiver accepts a friend request' do
    it 'a Friendship is created' do
      expect(sender.friendships.count).to eq(1)
    end
  end
end
