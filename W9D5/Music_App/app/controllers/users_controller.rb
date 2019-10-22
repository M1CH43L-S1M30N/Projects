class UsersController < ApplicationController


  def show
    render :index
  end
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Successfully signed up. Welcome to Music App"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Could not complete sign up"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end