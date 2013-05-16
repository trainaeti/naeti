require 'test_helper'

class WaitinglistsControllerTest < ActionController::TestCase
  setup do
    @waitinglist = waitinglists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waitinglists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waitinglist" do
    assert_difference('Waitinglist.count') do
      post :create, :waitinglist => @waitinglist.attributes
    end

    assert_redirected_to waitinglist_path(assigns(:waitinglist))
  end

  test "should show waitinglist" do
    get :show, :id => @waitinglist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @waitinglist.to_param
    assert_response :success
  end

  test "should update waitinglist" do
    put :update, :id => @waitinglist.to_param, :waitinglist => @waitinglist.attributes
    assert_redirected_to waitinglist_path(assigns(:waitinglist))
  end

  test "should destroy waitinglist" do
    assert_difference('Waitinglist.count', -1) do
      delete :destroy, :id => @waitinglist.to_param
    end

    assert_redirected_to waitinglists_path
  end
end
