class MailgunMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailgun_mailer.new_user_notification.subject
  #
  def new_user_notification(user)
    @greeting = "Hi"
    @user = user
    # @user = current_user

    mail to: "ric_lavers@outlook.com", subject: "welcome to  Almost-Anyone"
  end
end
