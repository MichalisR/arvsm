class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #User SessionHelper to manage user session
  include SessionsHelper

  #Use AuthorizationHelper to check if a user need to log in
  include AuthorizationHelper
end
