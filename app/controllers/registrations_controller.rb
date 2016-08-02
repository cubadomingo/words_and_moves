class RegistrationsController < Devise::RegistrationsController
   def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        flash[:success] = "You've signed up!"
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        flash[:success] = "We've sent you an email with a confirmation link!"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:danger] = "Please fill in all required fields!"
      redirect_to new_user_session_path
    end
  end

  protected

  def after_sign_up_path_for(resource)
    feed_path
  end

  def after_inactive_sign_up_path_for(resource)
    feed_path
  end
end
