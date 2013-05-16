require 'test_helper'

class ExpirationYearsControllerTest < ActionController::TestCase
  setup do
    @expiration_year = expiration_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expiration_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expiration_year" do
    assert_difference('ExpirationYear.count') do
      post :create, :expiration_year => @expiration_year.attributes
    end

    assert_redirected_to expiration_year_path(assigns(:expiration_year))
  end

  test "should show expiration_year" do
    get :show, :id => @expiration_year.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @expiration_year.to_param
    assert_response :success
  end

  test "should update expiration_year" do
    put :update, :id => @expiration_year.to_param, :expiration_year => @expiration_year.attributes
    assert_redirected_to expiration_year_path(assigns(:expiration_year))
  end

  test "should destroy expiration_year" do
    assert_difference('ExpirationYear.count', -1) do
      delete :destroy, :id => @expiration_year.to_param
    end

    assert_redirected_to expiration_years_path
  end
end
