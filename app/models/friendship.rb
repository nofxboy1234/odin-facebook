class Friendship < ApplicationRecord
  # after_create :create_inverse_relationship
  # after_destroy :destroy_inverse_relationship

  # belongs_to :friend_a,
  #            class_name: 'User',
  #            foreign_key: :user_id

  # belongs_to :friend_b,
  #            class_name: 'User',
  #            foreign_key: :friend_id

  belongs_to :user
  belongs_to :friend,
             class_name: 'User'

  private

  # def create_inverse_relationship
  #   friend.friendships.create(friend: user)
  # end

  # def destroy_inverse_relationship
  #   friendship = friend.friendships.find_by(friend: user)
  #   friendship.destroy if friendship
  # end
end
