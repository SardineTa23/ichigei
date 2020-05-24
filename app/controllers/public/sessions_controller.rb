# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    user = User.find_by(email: resource[:email])
    flash[:notice] = "Signed up successfully."
    user_path(user)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
