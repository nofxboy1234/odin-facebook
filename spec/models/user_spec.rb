require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  describe '#friendships', friendships: true do
    context 'when a user has no friendships' do
      it 'has a count of 0' do
        expect(user.friendships.count).to eq(0)
      end
    end

    context 'when a user has 1 friendship' do
      before do
        user.friendships.create!(friend: create(:user))
      end

      it 'has a count of 1' do
        expect(user.friendships.count).to eq(1)
      end
    end

    context 'when a user has 2 friendships' do
      before do
        user.friendships.create!(friend: create(:user))
        user.friendships.create!(friend: create(:user))
      end

      it 'has a count of 2' do
        expect(user.friendships.count).to eq(2)
      end
    end

    context 'when user has a friendship initiated by another user' do
      let!(:friendship) do
        create(:friendship, friend: user)
      end

      it 'has that friendship in its list of friendships' do
        expect(user.friendships).to include(friendship)
      end
    end

    context 'when user has a friendship initiated by itself' do
      let!(:friendship) do
        create(:friendship, user:)
      end

      it 'has that friendship in its list of friendships' do
        expect(user.friendships).to include(friendship)
      end
    end
  end

  describe '#friends', friends: true do
    context 'when a user has no friends' do
      it 'has a count of 0' do
        expect(user.friends.count).to eq(0)
      end
    end

    context 'when a user has 1 friend' do
      before do
        user.friends << create(:user)
      end

      it 'has a count of 1' do
        expect(user.friends.count).to eq(1)
      end
    end

    context 'when a user has 2 friends' do
      before do
        user.friends << create_list(:user, 2)
      end

      it 'has a count of 2' do
        expect(user.friends.count).to eq(2)
      end
    end

    context 'when user is added as a friend by another user' do
      let!(:another_user) do
        create(:user)
      end

      before do
        another_user.friends << user
      end

      it 'has that friend in its list of friends' do
        expect(user.friends).to include(another_user)
      end
    end

    context 'when user adds a friend itself' do
      let!(:another_user) do
        create(:user)
      end

      before do
        user.friends << another_user
      end

      it 'has that friend in its list of friends' do
        expect(user.friends).to include(another_user)
      end
    end
  end


  describe '#friend_requests_as_sender', friend_requests_as_sender: true do
    context 'when a user has not sent any friend requests' do
      it 'returns 0' do
        expect(user.friend_requests_as_sender.count).to eq(0)
      end
    end

    context 'when a user has sent 1 friend request1' do
      before do
        user.friend_requests_as_sender << create(:friend_request)
      end

      it 'returns 1' do
        expect(user.friend_requests_as_sender.count).to eq(1)
      end
    end

    context 'when a user has 2 sent friend requests' do
      before do
        user.friend_requests_as_sender << create_list(:friend_request, 2)
      end

      it 'returns 2' do
        expect(user.friend_requests_as_sender.count).to eq(2)
      end
    end
  end

  describe '#friend_requests_as_receiver', friend_requests_as_receiver: true do
    context 'when a user has not received any friend requests' do
      it 'returns 0' do
        expect(user.friend_requests_as_receiver.count).to eq(0)
      end
    end

    context 'when a user has received 1 friend request1' do
      before do
        user.friend_requests_as_receiver << create(:friend_request)
      end

      it 'returns 1' do
        expect(user.friend_requests_as_receiver.count).to eq(1)
      end
    end

    context 'when a user has 2 received friend requests' do
      before do
        user.friend_requests_as_receiver << create_list(:friend_request, 2)
      end

      it 'returns 2' do
        expect(user.friend_requests_as_receiver.count).to eq(2)
      end
    end
  end

  describe '#posts', posts: true do
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

  describe '#profile', profile: true do
    context 'when a user has created a profile' do
      let!(:profile) do
        user.create_profile!
      end

      it 'has 1 profile' do
        expect(user.profile).to be(profile)
      end
    end
  end

  describe '#notifications', notifications: true do
    context 'when a user has received no notifications' do
      it 'has 0 notifications' do
        expect(user.notifications.count).to eq(0)
      end
    end

    context 'when a user has received 1 notification' do
      before do
        user.notifications.create!
      end

      it 'has 1 notification' do
        expect(user.notifications.count).to eq(1)
      end
    end

    context 'when a user has received 2 notifications' do
      before do
        user.notifications << create_list(:notification, 2, user:)
      end

      it 'has 2 notifications' do
        expect(user.notifications.count).to eq(2)
      end
    end
  end

  describe '#comments', comments: true do
    context 'when a user has made no comments' do
      it 'has 0 comments' do
        expect(user.comments.count).to eq(0)
      end
    end

    context 'when a user has made 1 comment' do
      before do
        user.comments << create(:comment, user:)
      end

      it 'has 1 like' do
        expect(user.comments.count).to eq(1)
      end
    end

    context 'when a user has received 2 comments' do
      before do
        user.comments << create_list(:comment, 2, user:)
      end

      it 'has 2 comments' do
        expect(user.comments.count).to eq(2)
      end
    end
  end

  describe '#likes', likes: true do
    context 'when a user has not liked any posts' do
      it 'has 0 likes and 0 hearts' do
        expect(user.likes.count).to eq(0)
        expect(user.hearts.count).to eq(0)
      end
    end

    context 'when a user has liked 1 post' do
      before do
        user.likes << create(:like, user:)
      end

      it 'has 1 like and 1 heart' do
        expect(user.likes.count).to eq(1)
        expect(user.hearts.count).to eq(1)
      end
    end

    context 'when a user has liked 2 posts' do
      before do
        user.likes << create_list(:like, 2, user:)
      end

      it 'has 2 likes and 2 hearts' do
        expect(user.likes.count).to eq(2)
        expect(user.hearts.count).to eq(2)
      end
    end
  end

  describe '#hearts', true do
    context 'when a user has not hearted any posts' do
      it 'has 0 hearts and 0 likes' do
        expect(user.hearts.count).to eq(0)
        expect(user.likes.count).to eq(0)
      end
    end

    context 'when a user has hearted 1 post' do
      before do
        user.hearts << create(:like, user:)
      end

      it 'has 1 heart and 1 like' do
        expect(user.hearts.count).to eq(1)
        expect(user.likes.count).to eq(1)
      end
    end

    context 'when a user has hearted 2 posts' do
      before do
        user.hearts << create_list(:like, 2, user:)
      end

      it 'has 2 hearts and 2 likes' do
        expect(user.hearts.count).to eq(2)
        expect(user.likes.count).to eq(2)
      end
    end
  end

  # describe '#send_friend_request' do
  #   let!(:sender) do
  #     user
  #   end

  #   let!(:receiver) do
  #     create(:user)
  #   end

  #   let!(:friend_request) do
  #     create(:friend_request)
  #   end

  #   before do
  #     sender.send_friend_request(receiver, friend_request)
  #   end

  #   it 'the sender has the friend request listed in sent_friend_requests' do
  #     expect(sender.sent_friend_requests).to include(friend_request)
  #   end

  #   it 'the receiver has the friend request listed in received_friend_requests' do
  #     expect(receiver.received_friend_requests).to include(friend_request)
  #   end
  # end
end
