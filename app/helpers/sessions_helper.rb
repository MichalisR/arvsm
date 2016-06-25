module SessionsHelper

  #Registers a logged in user in the session
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the currently logged in user
  def logged_user
    @logged_user ||= User.find_by(id: session[:user_id])
  end

  #Checks if user is logged in
  def logged_in?
    !logged_user.nil?
  end

  #Logs out a user
  def log_out
   session.delete(:user_id)
   @current_user = nil
 end

 
end