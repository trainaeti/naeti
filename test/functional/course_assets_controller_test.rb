require 'test_helper'

class CourseAssetsControllerTest < ActionController::TestCase
  setup do
    @course_asset = course_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_asset" do
    assert_difference('CourseAsset.count') do
      post :create, :course_asset => @course_asset.attributes
    end

    assert_redirected_to course_asset_path(assigns(:course_asset))
  end

  test "should show course_asset" do
    get :show, :id => @course_asset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @course_asset.to_param
    assert_response :success
  end

  test "should update course_asset" do
    put :update, :id => @course_asset.to_param, :course_asset => @course_asset.attributes
    assert_redirected_to course_asset_path(assigns(:course_asset))
  end

  test "should destroy course_asset" do
    assert_difference('CourseAsset.count', -1) do
      delete :destroy, :id => @course_asset.to_param
    end

    assert_redirected_to course_assets_path
  end
end
