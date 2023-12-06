class FriendsController < UsersController
  def index
    @users = current_user.friends
    @profile_photos = email_photo_pairs.to_h
  end
end
