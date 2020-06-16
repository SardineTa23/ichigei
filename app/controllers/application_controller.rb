class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :name, :introduction, :profile_image, :display_name, :email,
                                      :birth_date, :phone_number, :status, :postal_code, :prefecture_code, :prefecture_name, :address_city, :address_street, :address_building])
  end
end
