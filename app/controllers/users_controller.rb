class UsersController < ApplicationController
  def index 
  end

  def show 
    @user = User.find_by(params[:id])
  end

  def new 
  end

  def create
    @user = User.create(user_params)

    redirect_to user_path(@user)
  end

  def edit
   end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
