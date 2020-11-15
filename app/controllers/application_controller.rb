class ApplicationController < ActionController::Base
    def current_user
      current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      session[:user_id]
    end

    def check_logged_in
        unless logged_in?
          flash[:danger] = 'Please log in or create an account to access this feature.'
          redirect_to login_url
        end
    end
end
