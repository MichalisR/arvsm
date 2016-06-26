class MainController < ApplicationController
   # User must be authenticated
  before_action :authorized_user
  # Confirm user is authorized as manager to view incoming
  before_action :is_manager, only: [:incoming]

  # View own requests
  def index
    @requests = logged_user.requests.order(updated_at: :desc)
  end

  # View incoming requests
  def employee_requests
    @requests = logged_user.assigned_requests.order(created_at: :desc)
  end

  def is_manager
    redirect_to(root_url) unless logged_user.manager?
  end
end
