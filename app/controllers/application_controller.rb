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
    if offers.count != 0
      temp =[]
       offers.each{|i|
        temp << i.price
      }
      temp.sort.last
    else
      "none"
    end
  end
  def find_max_index(offers)
    if offers.count != 0
      temp =[]
       offers[0].each{|i|
        temp << i.price
      }
      temp.sort
    else
      'none'
    end
  end
  #thats a array and find the average from offers
  def find_avg(offers)
    if offers.count != 0
      temp =[]
       offers[0].each{|i|
        temp << i.price
      }
      temp.sum.to_f/temp.count
    else
      "unknown"
    end

  end

end
