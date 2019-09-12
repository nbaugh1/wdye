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

  def google_create
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    binding.pry
    user = User.create_from_omniauth(access_token)
  
    cookies.signed[:user_id] = user.id
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
  
    flash[:success] = 'You are logged in'
  
    redirect_to root_path
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to "/login"
    else
      redirect_to root_path
    end
  end

  def auth
    request.env['omniauth.auth']
  end
end
