require 'test_helper'

class CourseRegistrantsControllerTest < ActionController::TestCase
  setup do
    @course_registrant = course_registrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_registrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_registrant" do
    assert_difference('CourseRegistrant.count') do
      post :create, :course_registrant => @course_registrant.attributes
    end

    assert_redirected_to course_registrant_path(assigns(:course_registrant))
  end

  test "should show course_registrant" do
    get :show, :id => @course_registrant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @course_registrant.to_param
    assert_response :success
  end

  test "should update course_registrant" do
    put :update, :id => @course_registrant.to_param, :course_registrant => @course_registrant.attributes
    assert_redirected_to course_registrant_path(assigns(:course_registrant))
  end

  test "should destroy course_registrant" do
    assert_difference('CourseRegistrant.count', -1) do
      delete :destroy, :id => @course_registrant.to_param
    end

    assert_redirected_to course_registrants_path
  end
end
