class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[ name image])
    update_attrs = %i[name image]
    devise_parameter_sanitizer.permit :user_update, keys: update_attrs
  end
end