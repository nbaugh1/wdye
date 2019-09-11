class SessionsController < ApplicationController
  helper_method :logged_in?, :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      authenticated = @user.authenticate(params[:user][:password])
      if authenticated
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to '/login'
    else
      redirect_to root_path
    end
  end
end
