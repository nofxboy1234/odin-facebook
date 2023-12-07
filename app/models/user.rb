class User < ApplicationRecord
  has_many :friendships,
           lambda { |user|
             unscope(where: :user_id)
               .where(user_id: user.id)
               .or(Friendship.where(friend_id: user.id))
           }

  has_many :friends,
           lambda { |user|
             # Don't get Users with the user's id (can't be friends with yourself)
             # Add Friendship.user_id to the join condition so we also
             # get any Users that added us as a friend
             where.not(id: user.id)
                  .joins('OR users.id = friendships.user_id')
           },
           through: :friendships

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

  # scope :friends_with, ->(user) { friends.where(id: user).count.positive? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]

      user.create_new_profile
      NotificationsMailer.sign_up.deliver_later!
    end
  end

  def send_friend_request(to:)
    notification = send_notification(to:)
    friend_requests_as_sender.create!(receiver: to, notification:)
  end

  def sent_friend_request_to?(user)
    friend_requests_as_sender.where(receiver: user).count.positive?
  end

  def received_friend_request_from?(user)
    friend_requests_as_receiver.where(sender: user).count.positive?
  end

  def friends_with?(user)
    friends.where(id: user).count.positive?
  end

  def profile_photo
    email_address = email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def create_new_profile
    build_profile(name: email.split('@').first)
  end

  private

  def send_notification(to:)
    Notification.create!(user: to)
  end
end
