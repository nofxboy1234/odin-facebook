class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.sign_up.subject
  #
  def sign_up
    @greeting = "Hi"
    @user = params[:user]
    
    mail to: @user.email
  end
end
