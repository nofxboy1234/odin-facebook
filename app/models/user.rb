class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # has_many :friendships, foreign_key: :user_id
  # has_many :friends, through: :friendships, source: :friend_b


  # has_many :friend_requests_as_sender,
  #          class_name: 'FriendRequest',
  #          foreign_key: :sender_id

  # has_many :friend_requests_as_receiver,
  #          class_name: 'FriendRequest',
  #          foreign_key: :receiver_id

  # has_many :friendships_as_friend_a,
  #          class_name: 'Friendship',
  #          foreign_key: :user_id

  # has_many :friendships_as_friend_b,
  #          class_name: 'Friendship',
  #          foreign_key: :friend_id

  # has_many :friend_as, through: :friendships_as_friend_b
  # has_many :friend_bs, through: :friendships_as_friend_a


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

  # def friendships
  #   friendships_as_friend_a + friendships_as_friend_b
  # end

  # def friends
  #   friend_as + friend_bs
  # end
end
