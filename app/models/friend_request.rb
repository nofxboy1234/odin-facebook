class FriendRequest < ApplicationRecord
  # belongs_to :user
  # belongs_to :friendship, optional: true

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'


  def accept

  end
end
