class Notification < ApplicationRecord
  has_one :friend_request, dependent: :destroy
  belongs_to :user
end
