require 'test_helper'

class UserAssetsControllerTest < ActionController::TestCase
  setup do
    @user_asset = user_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_asset" do
    assert_difference('UserAsset.count') do
      post :create, :user_asset => @user_asset.attributes
    end

    assert_redirected_to user_asset_path(assigns(:user_asset))
  end

  test "should show user_asset" do
    get :show, :id => @user_asset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_asset.to_param
    assert_response :success
  end

  test "should update user_asset" do
    put :update, :id => @user_asset.to_param, :user_asset => @user_asset.attributes
    assert_redirected_to user_asset_path(assigns(:user_asset))
  end

  test "should destroy user_asset" do
    assert_difference('UserAsset.count', -1) do
      delete :destroy, :id => @user_asset.to_param
    end

    assert_redirected_to user_assets_path
  end
end
