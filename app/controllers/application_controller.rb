class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :name, :phone_number, :avatar, :country, :admin, :ngo, :gov, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:surname, :name, :phone_number, :avatar, :country, :admin, :ngo, :gov, :remember_me])
  end
end
