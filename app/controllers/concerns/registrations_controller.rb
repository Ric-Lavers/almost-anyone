class RegistrationsController < Devise::RegistrationsController
  protected


  def after_sign_up_path_for(resource)
    MailgunMailer.new_user_notification(current_user).deliver_now
    format.html{redirect_to root_path}
    new_profile_url
  end



end
