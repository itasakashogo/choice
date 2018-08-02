
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :logged_in?


  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    end
  end

  def after_sign_out_path_for(resource)

    case resource
    when :user
      root_path
     end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password,:profile_image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile_image])
  end

end

private


  def logged_in?
    !!session[:user_id]
  end



