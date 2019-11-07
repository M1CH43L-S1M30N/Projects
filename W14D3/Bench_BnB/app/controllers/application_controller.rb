# Top level comment
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
   # clllr
  def current_user
    @curent_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @curent_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
