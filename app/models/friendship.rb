class Friendship < ApplicationRecord
  has_many :friend_requests
  has_many :users, through: :friend_requests
end
