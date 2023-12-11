class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[destroy]

  # GET /friend_requests or /friend_requests.json
  def index
    @friend_requests = current_user.friend_requests_as_sender
  end

  # POST /friend_requests or /friend_requests.json
  def create
    @friend_request = notification.build_friend_request(friend_request_params)

    respond_to do |format|
      if @friend_request.save
        format.html do
          redirect_to users_path,
                      notice: "Friend request was sent!"
        end
        format.json do
          render :show, status: :created,
                        location: @friend_request
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @friend_request.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /friend_requests/1 or /friend_requests/1.json
  def destroy
    @friend_request.accept
    # @friend_request.destroy!
    @friend_request.notification.destroy!

    respond_to do |format|
      format.html do
        redirect_to notifications_path,
                    notice: 'Friend request was accepted!'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friend_request_params
    params.require(:friend_request)
          .permit(:sender_id, :receiver_id)
  end

  def notification
    Notification.new(user_id: friend_request_params[:receiver_id])
  end
end
