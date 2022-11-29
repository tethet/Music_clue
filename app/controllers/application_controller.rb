class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:accepted, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:accepted, :email, :password, :password_confirmations])
    #devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :password, :password_confirmation, :accepted)}
    #devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:user_name, :password, :password_confirmation, :accepted)}
  end

end
