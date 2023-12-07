class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.sign_up.subject
  #
  def sign_up
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
