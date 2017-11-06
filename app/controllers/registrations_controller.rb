class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
      # send to the new profile page
      new_profile_path # Or :prefix_to_your_route
  end
end
