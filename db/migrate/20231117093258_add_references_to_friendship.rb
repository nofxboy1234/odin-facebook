class AddReferencesToFriendship < ActiveRecord::Migration[7.1]
  def change
    add_reference :friendships, :user, null: false, foreign_key: true
    add_reference :friendships, :friend, null: false, foreign_key: { to_table: :users }
  end
end
