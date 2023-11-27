require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'when user1 adds user2 as a friend' do
    describe '#user' do
      let!(:user1) do
        create(:user)
      end

      let!(:user2) do
        create(:user)
      end

      before do
        user1.friends << user2
      end

      it 'returns user1' do
        expect(Friendship.last.user).to eq(user1)
      end
    end

    describe '#friend' do
      let!(:user1) do
        create(:user)
      end

      let!(:user2) do
        create(:user)
      end

      before do
        user1.friends << user2
      end

      it 'returns user2' do
        expect(Friendship.last.friend).to eq(user2)
      end
    end
  end
end
