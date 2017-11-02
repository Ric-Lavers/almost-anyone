class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #dont apply this to the guest journey
  before_action :authenticate_user!
end
