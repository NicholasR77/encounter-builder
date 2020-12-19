# Try to remove and refactor for views only - move to application controller or concerns possibly
module ApplicationHelper
    def current_user
        current_user ||= User.find_by(id: session[:user_id])
      end
  
      def logged_in?
        session[:user_id]
      end
end
