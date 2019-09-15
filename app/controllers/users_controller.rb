class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    if logged_in?
      @user = User.find(params[:id])
      @visits = Visit.all
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.id == nil 
      @errors = @user.errors.full_messages
      render :new
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def visits_index
    @user = User.find(params[:id])
    @visits = @user.visits
    render 'visits/index'
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
