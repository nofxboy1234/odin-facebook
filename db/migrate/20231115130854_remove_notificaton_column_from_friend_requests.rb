class RemoveNotificatonColumnFromFriendRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :friend_requests, :notification_id
  end
end
