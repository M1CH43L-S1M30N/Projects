class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:email], params[:password])
    if user
      log_in_user!(user)
      redirect_to users_url
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    flash[:success] = "Successfully logged out"
    redirect_to users_url
  end

end