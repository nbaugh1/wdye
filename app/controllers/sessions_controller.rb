class SessionsController < ApplicationController
  helper_method :logged_in?, :current_user

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      @user.google_token = auth.credentials.token
      redirect_to root_path
    elsif
      @user = User.find_by(username: params[:user][:username])
      authenticated = @user.authenticate(params[:user][:password])
      if authenticated
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def auth
    request.env['omniauth.auth']
  end
end
