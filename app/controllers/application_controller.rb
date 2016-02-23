class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    main_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :nearest_station
  end
end
