class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception

  # Assign the current user if exists.
  def current_user
    return nil unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Check if the user is logged.
  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in'
    redirect_to login_url
  end

  # Check if theres is a current user.
  def logged_in?
    !current_user.nil?
  end

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
