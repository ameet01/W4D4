class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if !session[:session_token]
    user = User.find_by(session_token: session[:session_token])
    @current_user ||= user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_logged_in
    redirect_to new_session_url if !logged_in?
  end

  def require_logged_out
    redirect_to cats_url if logged_in?
  end
end
