class RemoveUnusedColumnsFromFriendRequests < ActiveRecord::Migration[7.1]
  def change
    remove_columns :friend_requests, :user_id, :friendship_id
  end
end
