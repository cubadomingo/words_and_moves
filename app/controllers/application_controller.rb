class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #Sets up parameters that are permitted for new account registration and updating account information
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :username, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :username, :password, :password_confirmation, :current_password)
    end
  end

  private

  #route to redirect to after signing in
  def after_sign_in_path_for(resource)
    feed_path
  end

  #route to redirect to after signing up
  def after_sign_up_path_for(resource)
    root_path
  end

  #route to redirect to after updating information
  def after_update_path_for(resource)
    feed_path
  end
end
