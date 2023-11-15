require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  let!(:post) do
    create(:post, content: 'hello', author: user)
  end

  describe '#posts' do
    context 'when the user creates one post' do
      before { user.posts << post }

      it 'shows that post in the array' do
        expect(user.posts).to include(post)
      end

      it 'has content: "hello" in the first post' do
        first_post = user.posts.first
        expect(first_post.content).to eql('hello')
      end
    end
  end
end
