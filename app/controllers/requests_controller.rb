class RequestsController < ApplicationController
   # User must be authenticated
  before_action :authorized_user
  # Check if a user is manager so he can review requests
  before_action :is_assigned, only: [:show, :update]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    @request.user = logged_user

    @request.status = Request.statuses[:requested]

    if @request.partial? && @request.valid?
      begin
        time = Time.parse(@request.starting_time)
        @request.starting = Time.parse(@request.partial_starting)
                                .change(hour: time.hour,
                                        minute: time.min)
        time = Time.parse(@request.end_time)
        @request.end_date = @request.starting_date
                                  .change(hour: time.hour,
                                          minute: time.min)
      rescue
      end
    end

    if @request.save

      #Mailer.notify_incoming_request(@request).deliver_later
      flash[:success] = 'Your absense request has been submitted successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    if params['approved']
      @request.status = Request.statuses[:approved]
    elsif params['denied']
      @request.status = Request.statuses[:denied]
    end

    if @request.update_attributes(update_params)
      #Mailer.notify_changed_request_status(@request).deliver_later
      redirect_to employee_requests_path
    else
      render 'show'
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:description, :starting_date, :starting_time, :end_date, :end_time, :absence_type, :comment, :no_days, :approver_id)
    end

    def is_assigned
      request = Request.find(params[:id])
      redirect_to(root_url) unless request.approver == logged_user
    end

    def update_params
      params.require(:request).permit(:comment)
    end
end
