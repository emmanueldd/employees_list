class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [])
      devise_parameter_sanitizer.permit(:account_update, keys: [])
    elsif resource_class == Pro
      devise_parameter_sanitizer.permit(:sign_up, keys: [])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :avatar])
    end
  end

  def current_resource
    if user_signed_in?
      current_user
    elsif pro_signed_in?
      current_pro
    end
  end
  helper_method :current_resource

end
