class ApplicationController < ActionController::Base
    def check_logged_in
        unless helpers.logged_in?
          flash[:danger] = 'Please log in or create an account to access this feature.'
          redirect_to login_url
        end
    end
end
