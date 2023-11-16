require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  describe '#posts' do
    context 'when a user has no posts' do
      it 'returns 0' do
        expect(user.posts.count).to eq(0)
      end
    end

    context 'when a user creates one post with content: "hello"' do
      let!(:post) do
        create(:post, author: user)
      end

      before { post.update!(content: 'hello') }

      it 'returns 1' do
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

    context 'when a user creates 2 posts' do
      let!(:posts) do
        create_list(:post, 2, author: user)
      end

      it 'returns 2' do
        expect(user.posts.count).to eq(2)
      end

      it 'has the posts created' do
        expect(user.posts).to eq(posts)
      end
    end
  end

  describe '#sent_friend_requests' do
    context 'when a user has no sent friend requests' do
      it 'returns 0' do
        expect(user.sent_friend_requests.count).to eq(0)
      end
    end

    context 'when a user has 1 sent friend requests' do
      before do
        user.sent_friend_requests << create(:friend_request)
      end

      it 'returns 1' do
        expect(user.sent_friend_requests.count).to eq(1)
      end
    end

    context 'when a user has 2 sent friend requests' do
      before do
        user.sent_friend_requests << create_list(:friend_request, 2)
      end

      it 'returns 2' do
        expect(user.sent_friend_requests.count).to eq(2)
      end
    end
  end

  describe '#received_friend_requests' do
    context 'when a user has no received friend requests' do
      it 'returns 0' do
        expect(user.received_friend_requests.count).to eq(0)
      end
    end

    context 'when a user has 1 received friend requests' do
      before do
        user.received_friend_requests << create(:friend_request)
      end

      it 'returns 1' do
        expect(user.received_friend_requests.count).to eq(1)
      end
    end

    context 'when a user has 2 received friend requests' do
      before do
        user.received_friend_requests << create_list(:friend_request, 2)
      end

      it 'returns 2' do
        expect(user.received_friend_requests.count).to eq(2)
      end
    end
  end
end
