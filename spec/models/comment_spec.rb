require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#post' do
    context 'when a comment is made on a post' do
      let!(:post) do
        create(:post)
      end

      let!(:comment) do
        create(:comment, post:)
      end

      it 'returns the post that the comment belongs to' do
        expect(comment.post).to be(post)
      end
    end
  end

  describe '#user' do
    context 'when a comment is made by a user' do
      let!(:user) do
        create(:user)
      end

      let!(:comment) do
        create(:comment, user:)
      end

      it 'returns the user that made the comment' do
        expect(comment.user).to be(user)
      end
    end
  end
end
