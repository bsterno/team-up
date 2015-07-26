class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end
  end

  def authorize_admin!
    if current_user.nil? || !current_user.admin?
      flash[:notice] = "You are not authorized to view this resource."
      redirect_to root_path
    end
  end
end
