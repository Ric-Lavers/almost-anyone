class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #dont apply this to the guest journey

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def find_max(offers)
    temp =[]
     offers.each{|i|
      temp << i.price
    }
    temp.sort.last
  end
  def find_max_index(offers)
    temp =[]
     offers[0].each{|i|
      temp << i.price
    }
    temp.sort
  end
end
