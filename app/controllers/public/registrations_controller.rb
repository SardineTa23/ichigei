# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    user = User.find_by(email: resource[:email])
    flash[:notice] = "Welcome! You have signed up successfully."
    edit_user_path(user)
  end


  def after_update_path_for(resource)
    user = User.find_by(configure_account_update_params)
    flash[:notice] = "successfully."
    user_path(user)
  end
end
