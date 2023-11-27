class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :notification

  def accept
    Friendship.create!(user: sender, friend: receiver)
  end
end
