module AuthorizationHelper
  # Forces a non authorized user to login
  def authorized_user
    unless logged_in?
      redirect_to login_url
    end
  end
end