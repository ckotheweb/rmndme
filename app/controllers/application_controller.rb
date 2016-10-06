class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception #Loged-in session has to be created to provide navigation
  #checkprofile logic is invoked from profiles_controller after user is logged 
  def after_sign_in_path_for(resource)
  "/checkprofile"
  end
  
  #below allows to pass "admin" parameter to db
  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :admin])
  end
    
end
