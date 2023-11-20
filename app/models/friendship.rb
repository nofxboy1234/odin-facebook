class Friendship < ApplicationRecord
  belongs_to :friend_a,
             class_name: 'User',
             foreign_key: :user_id

  belongs_to :friend_b,
             class_name: 'User',
             foreign_key: :friend_id
end
