class ApplicationController < ActionController::Base
    
  helper_method :current_user, :logged_in?, :current_restaurant
    
    def current_user
      @user = User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      current_user
    end

    def current_restaurant
      @restaurant = Restaurant.find_by(id: session[:restaurant_id])
    end
  
    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end