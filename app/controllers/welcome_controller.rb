class WelcomeController < ApplicationController
    def index
        if !logged_in?
            render :welcome
        else
            redirect_to user_path(current_user)
        end
    end
end