class Notification < ApplicationRecord
  has_one :friend_request
  belongs_to :user
end
