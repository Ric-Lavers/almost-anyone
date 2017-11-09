require "rails_helper"

RSpec.describe MailgunMailer, type: :mailer do
  describe "new_user_notification" do
    let(:mail) { MailgunMailer.new_user_notification }

  end
end
