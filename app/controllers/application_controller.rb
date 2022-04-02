class ApplicationController < ActionController::Base
  def index
    
  end

  protected 

  def configure_permitted_parameters
    user_attributes = [:email, :username, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
