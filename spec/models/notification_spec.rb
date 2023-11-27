require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#friend_request' do
    subject!(:notification) do
      create(:notification)
    end

    let!(:friend_request) do
      create(:friend_request, notification:)
    end

    context 'when a notification has one friend_request' do
      it 'returns the friend_request' do
        expect(notification.friend_request).to be(friend_request)
      end
    end
  end
end
