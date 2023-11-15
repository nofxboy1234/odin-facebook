require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  let!(:post) do
    create(:post, author: user)
  end

  # let!(:posts) do
  #   create_list(:post, 2, author: user)
  # end

  # let!(:friendship) do
  #   create(:friendship)
  # end

  describe '#posts' do
    context 'when a user creates one post' do
      before { post.update!(content: 'hello') }

      it 'has one post' do
        expect(user.posts.count).to eq(1)
      end

      it 'shows that post in the array' do
        expect(user.posts).to include(post)
      end

      it 'has content: "hello" in the first post' do
        first_post = user.posts.first
        expect(first_post.content).to eql('hello')
      end
    end

    # context 'when a user creates multiple posts' do


    #   expect(user.posts)      
    # end
  end

  # describe '#friendships'
end
