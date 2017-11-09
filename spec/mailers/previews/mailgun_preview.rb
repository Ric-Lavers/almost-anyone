# Preview all emails at http://localhost:3000/rails/mailers/mailgun
class MailgunPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailgun/new_user_notification
  def new_user_notification
    MailgunMailer.new_user_notification
  end

end
