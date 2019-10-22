class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:username], params[:password])

    if user
      session[:session_token] = user.session_token
      flash[:success] = "You are now logged in"
      redirect cats_url
    else
      flash[:error] = "Wrong username/password"
      render :new, status: 422
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
