class RemoveSenderFromFriendRequest < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key "friend_requests", "users", column: "sender_id"
    remove_index :friend_requests, :sender_id
    remove_column :friend_requests, :sender_id
  end
end
