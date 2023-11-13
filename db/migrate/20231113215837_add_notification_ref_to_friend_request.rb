class AddNotificationRefToFriendRequest < ActiveRecord::Migration[7.1]
  def change
    add_reference :friend_requests, :notification,
                  null: true,
                  foreign_key: true
  end
end
