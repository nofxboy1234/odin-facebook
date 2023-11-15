class ChangeColumnNullToFalseForForeignKeys < ActiveRecord::Migration[7.1]
  def change
    change_column_null :comments, :post_id, false
    change_column_null :comments, :user_id, false

    change_column_null :friend_requests, :notification_id, false
    change_column_null :friend_requests, :user_id, false
    change_column_null :friend_requests, :friendship_id, false

    change_column_null :likes, :post_id, false
    change_column_null :likes, :user_id, false

    change_column_null :notifications, :user_id, false

    change_column_null :posts, :author_id, false

    change_column_null :profiles, :user_id, false
  end
end
