class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :university_id, :gender, :current_password, :first_name, :last_name, :image, :image_uid) }
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :university_id, :gender, :first_name, :last_name, :image, :image_uid)}
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
