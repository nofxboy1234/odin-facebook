require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  describe '#posts' do
    context 'when a user creates one post with content: "hello"' do
      let!(:post) do
        create(:post, author: user)
      end

      before { post.update!(content: 'hello') }

      it 'has 1 post' do
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

      it 'has 2 posts' do
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
        # user.sent_friend_requests.create!(
        #   user: create(:user),
        #   friendship: create(:friendship),
        #   sender: create(:user)
        # )
        user.sent_friend_requests << create(:friend_request)
      end

      it 'returns 1' do
        expect(user.sent_friend_requests.count).to eq(1)
      end
    end
  end

  # describe '#friendships' do
  #   context 'when user is in a friendship with user2' do
  #     let!(:user2) do
  #       create(:user)
  #     end

  #     let!(:friendship) do
  #       create(:friendship)
  #     end

  #     before do
  #       user.friendships << friendship
  #       user2.friendships << friendship
  #     end

  #     it 'has 1 friendship' do
  #       expect(user.friendships.count).to eq(1)
  #     end

  #     it 'is friends with user2' do
  #       expect(user.friendships.first.users).to include(user2)
  #     end
  #   end
  # end
end
