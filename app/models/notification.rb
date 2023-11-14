class Notification < ApplicationRecord
  has_many :friend_requests
  belongs_to :user
end
