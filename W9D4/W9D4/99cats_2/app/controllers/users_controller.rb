class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up!"
      redirect_to cats_url
    else
      flash[:errors] = "Invalid sign-up, see below for details"
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
