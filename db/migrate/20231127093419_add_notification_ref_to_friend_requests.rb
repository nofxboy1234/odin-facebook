class AddNotificationRefToFriendRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :friend_requests, :notification, null: false, foreign_key: true
  end
end
