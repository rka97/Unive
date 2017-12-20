module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def redirect_if_not_admin
      redirect_to(root_url) unless logged_in? && current_user.admin?
    end

    def is_admin?
      logged_in? && @current_user.profile_owner_type == "Admin"
    end

    def is_teacher?
      logged_in? && @current_user.profile_owner_type == "Teacher"
    end

    def is_student?
      logged_in? && @current_user.profile_owner_type == "Student"
    end

    def redirect_if_not_student
      redirect_to(root_url) unless current_user.profile_owner_type == "Student"
    end

    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
      !current_user.nil?
    end
    # Logs out the current user.
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
    # Redirects to stored location (or to the default).
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
    # Stores the URL trying to be accessed.
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
end
