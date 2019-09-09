class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new 
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to user_path(@user)
    else
      redirect_to new
    end

  end

  def edit
   end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
