require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { absence_type: @request.absence_type, approver_id: @request.approver_id, comment: @request.comment, description: @request.description, end_date: @request.end_date, no_days: @request.no_days, starting_date: @request.starting_date, status: @request.status }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    patch :update, id: @request, request: { absence_type: @request.absence_type, approver_id: @request.approver_id, comment: @request.comment, description: @request.description, end_date: @request.end_date, no_days: @request.no_days, starting_date: @request.starting_date, status: @request.status }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
