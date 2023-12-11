class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  # GET /users or /users.json
  def index
    @users = User.select { |user| potential_friend?(user) }
    @profile_photos = email_photo_pairs.to_h
  end

  # GET /users/1 or /users/1.json
  def show
    @profile_photo = @user.profile_photo
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def potential_friend?(user)
    return true unless current_user.sent_friend_request_to?(user) ||
                       current_user.received_friend_request_from?(user) ||
                       current_user.friends_with?(user) ||
                       user.eql?(current_user)

    false
  end

  def email_photo_pairs
    @users.map do |user|
      [user.email, user.profile_photo]
    end
  end
end
