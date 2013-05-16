require 'test_helper'

class ExpirationMonthsControllerTest < ActionController::TestCase
  setup do
    @expiration_month = expiration_months(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expiration_months)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expiration_month" do
    assert_difference('ExpirationMonth.count') do
      post :create, :expiration_month => @expiration_month.attributes
    end

    assert_redirected_to expiration_month_path(assigns(:expiration_month))
  end

  test "should show expiration_month" do
    get :show, :id => @expiration_month.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @expiration_month.to_param
    assert_response :success
  end

  test "should update expiration_month" do
    put :update, :id => @expiration_month.to_param, :expiration_month => @expiration_month.attributes
    assert_redirected_to expiration_month_path(assigns(:expiration_month))
  end

  test "should destroy expiration_month" do
    assert_difference('ExpirationMonth.count', -1) do
      delete :destroy, :id => @expiration_month.to_param
    end

    assert_redirected_to expiration_months_path
  end
end
