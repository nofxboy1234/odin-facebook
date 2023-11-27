require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#post' do
    context 'when a post is liked' do
      let!(:post) do
        create(:post)
      end

      let!(:like) do
        create(:like, post:)
      end

      it 'returns the post that was liked' do
        expect(like.post).to be(post)
      end
    end
  end

  describe '#user' do
    context 'when a user likes a post' do
      let!(:user) do
        create(:user)
      end

      let!(:like) do
        create(:like, user:)
      end

      it 'returns the user that liked a post' do
        expect(like.user).to be(user)
      end
    end
  end
end
