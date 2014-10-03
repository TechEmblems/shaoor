class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  check_authorization unless: :skip_authorization

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.blank?
      redirect_to new_user_session_path
    else
      flash[:error] = exception.message
      redirect_to root_path
    end
  end

  private
  def skip_authorization
    respond_to?(:devise_controller?) or authenticate_admin_user!
  end
end
