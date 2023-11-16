class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'

  belongs_to :user
  belongs_to :friendship
end
