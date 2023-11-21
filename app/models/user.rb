class User < ApplicationRecord
  has_many :friendships,
           lambda { |user|
             unscope(where: :user_id)
               .where(user_id: user.id)
               .or(Friendship.where(friend_id: user.id))
           }

  has_many :friends,
           lambda { |user|
             where.not(id: user.id)
                  .joins('OR users.id = friendships.user_id')
           },
           through: :friendships

  has_many :friendships_as_user,
           class_name: 'Friendship',
           foreign_key: :user_id

  has_many :friendships_as_friend,
           class_name: 'Friendship',
           foreign_key: :friend_id

  # If creating 2 :friendships records for each friendship
  # e.g. [{user_id: 1, friend_id: 2}, {user_id: 2, friend_id: 1}]
  # then only call this method
  has_many :user_friends,
           through: :friendships_as_friend,
           source: :user

  has_many :friend_friends,
           through: :friendships_as_user,
           source: :friend

  has_many :friend_requests_as_sender,
           class_name: 'FriendRequest',
           foreign_key: :sender_id

  has_many :friend_requests_as_receiver,
           class_name: 'FriendRequest',
           foreign_key: :receiver_id

  has_many :posts, foreign_key: :author_id
  has_one :profile
  has_many :notifications
  has_many :comments

  has_many :likes
  has_many :hearts, class_name: 'Like'

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

  # If creating 1 :friendships record for each mutual friendship
  # e.g. [{user_id: 1, friend_id: 2}]
  # then call these methods 
  def all_friendships
    reload
    friendships_as_user + friendships_as_friend
  end

  def all_friends
    reload
    user_friends + friend_friends
  end
end
