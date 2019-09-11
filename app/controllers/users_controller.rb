class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user
      flash[:notify] = "New Account Created.\nLogging in..."
      session[:user_id] = @user.id
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
