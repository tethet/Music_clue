class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
      top_path
  end
  
  def after_sign_up_path_for(resource)
      top_path
  end
  
  
  def after_sign_out_path_for(resource)
      top_path
  end
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :password, :password_confirmation, :accepted)}
  end

end
