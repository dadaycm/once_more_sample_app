module DenglusHelper
  # Logs in the given user.
  def log_in(user)
    # puts "[{LHY:log_in]#{session.inspect}[LHY}]"
    session[:user_id] = user.id
    puts "[{LHY:log_in 2]#{session[:user_id]}[LHY}]"

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
    # puts "[{LHY: logout]#{session}[LHY}]"

  end
end
