class RenameColumnsOnFriendships < ActiveRecord::Migration[7.1]
  def change
    rename_column :friendships, :user_id, :friend_a_id
    rename_column :friendships, :friend_id, :friend_b_id
  end
end
