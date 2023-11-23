class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # def accept

  # end

  # def send_friend_request(to_user, friend_request)
  #   sent_friend_requests << friend_request
  #   to_user.received_friend_requests << friend_request
  # end

end
