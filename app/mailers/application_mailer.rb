class ApplicationMailer < ActionMailer::Base
  default from: 'me@almostanything.com'
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
  layout 'mailer'
end
