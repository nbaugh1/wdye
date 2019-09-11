module ApplicationHelper
    def nav_bar_if_logged_in
        if logged_in?
            render 'layouts/nav_bar'
        end
    end
end
