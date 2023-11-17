class Friendship < ApplicationRecord
  belongs_to :friend_a, class_name: 'User'
  belongs_to :friend_b, class_name: 'User'

  
  # has_many :friend_requests
  # has_many :users, through: :friend_requests

  
end
