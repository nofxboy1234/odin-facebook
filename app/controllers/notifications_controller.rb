class NotificationsController < ApplicationController
  # GET /notifications or /notifications.json
  def index
    @notifications = current_user.notifications
  end
end
