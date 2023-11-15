class AddRefsToFriendRequest < ActiveRecord::Migration[7.1]
  def change
    add_reference :friend_requests, :user,
                  null: true,
                  foreign_key: true
    add_reference :friend_requests, :friendship,
    null: true,
    foreign_key: true
  end
end
