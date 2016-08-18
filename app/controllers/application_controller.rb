class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :username, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :username, :password, :password_confirmation, :current_password)
    end
  end

  private

  def after_sign_in_path_for(resource)
    feed_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    feed_path
  end
end
