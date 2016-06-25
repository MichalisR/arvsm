class SessionsController < ApplicationController
  def new
  	redirect_to :root if logged_in?
  end

  # Performs authentication
  def create
  	user = User.find_by(email: params[:email].downcase)

  	if user && user.authenticate(params[:password])
  		log_in user
  		redirect_to :root
  	else
  		flash.now[:error] = 'Invalid email/password combination'
      	render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to login_url
  end
end
