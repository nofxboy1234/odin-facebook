class AddSenderRefToFriendRequest2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :friend_requests, :sender, null: false, foreign_key: { to_table: :users }
  end
end
