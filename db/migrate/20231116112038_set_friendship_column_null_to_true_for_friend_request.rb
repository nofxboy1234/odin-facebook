class SetFriendshipColumnNullToTrueForFriendRequest < ActiveRecord::Migration[7.1]
  def change
    change_column_null :friend_requests, :friendship_id, true
  end
end
