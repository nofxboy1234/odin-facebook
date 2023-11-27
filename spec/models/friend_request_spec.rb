require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  let!(:user1) do
    create(:user)
  end

  let!(:user2) do
    create(:user)
  end

  subject(:friend_request) do
    create(:friend_request, sender: user1, receiver: user2)
  end

  describe '#sender', sender: true do
    context 'when user1 sends a FriendRequest to user2' do
      it 'returns a sender that is user1' do
        sender = friend_request.sender
        expect(sender).to be(user1)
      end
    end
  end

  describe '#receiver', receiver: true do
    context 'when user1 sends a FriendRequest to user2' do
      it 'returns a receiver that is user2' do
        receiver = friend_request.receiver
        expect(receiver).to be(user2)
      end

      # it { is_expected.to have_attributes(receiver: user2) }
    end
  end
end
