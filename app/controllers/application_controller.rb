class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    !!session[:user_id] or redirect_to root_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :current_user
end
