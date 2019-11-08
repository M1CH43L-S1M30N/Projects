class Api::SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
      )

    if user
      login(user) # render somthing afte user has been loggedin
      render json: { username: "#{user.username}", id: "#{user.id}"}
    else
      render json: ['Invalid username/password'], status: 401
    end
  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: ["Not logged in"], status: 404
    end
  end
end
