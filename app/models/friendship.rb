class Friendship < ApplicationRecord
  belongs_to :someone,
             class_name: 'User',
             foreign_key: :user_id,
             inverse_of: :friendships
  belongs_to :friend, class_name: 'User'

  # belongs_to :friend_a, class_name: 'User'
  # belongs_to :friend_b, class_name: 'User'
end
