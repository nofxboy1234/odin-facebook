require 'rails_helper'

RSpec.describe Post, type: :model do
  subject!(:post) do
    create(:post)
  end

  describe '#author' do
    context 'when a post belongs to an author' do
      let!(:author) do
        create(:user)
      end

      before do
        post.update!(author:)
      end

      it 'returns the user it belongs to' do
        expect(post.author).to be(author)
      end
    end
  end

  describe '#comments' do
    context 'when a post has comments on it' do
      let!(:comments) do
        create_list(:comment, 2, post:)
      end

      it 'returns the comments it has' do
        expect(post.comments).to eq(comments)
      end
    end
  end

  describe '#likes' do
    context 'when a post has been liked' do
      let!(:likes) do
        post.likes << create_list(:like, 3)
      end

      it 'returns the likes it has' do
        expect(post.likes).to be(likes)
      end
    end
  end
end
