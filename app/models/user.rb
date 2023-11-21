class User < ApplicationRecord
  has_many :friendships,
           lambda { |user|
             unscope(where: :user_id)
               .where(user_id: user.id)
               .or(Friendship.where(friend_id: user.id))
           }
  #  inverse_of: :user,
  #  dependent: :destroy

  has_many :friends,
           lambda { |user|
            # UsersQuery.friends(user_id: user.id)
            where.not(id: user.id)
            .joins("OR users.id = friendships.user_id")
           },
           through: :friendships

  # has_many :friend_requests_as_sender,
  #          class_name: 'FriendRequest',
  #          foreign_key: :sender_id

  # has_many :friend_requests_as_receiver,
  #          class_name: 'FriendRequest',
  #          foreign_key: :receiver_id

  # has_many :posts, foreign_key: :author_id
  # has_one :profile
  # has_many :notifications
  # has_many :comments

  # has_many :likes
  # has_many :hearts, class_name: 'Like'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # def send_friend_request(to_user, friend_request)
  #   sent_friend_requests << friend_request
  #   to_user.received_friend_requests << friend_request
  # end
end
