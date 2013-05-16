require 'test_helper'

class CourseDatesControllerTest < ActionController::TestCase
  setup do
    @course_date = course_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_date" do
    assert_difference('CourseDate.count') do
      post :create, :course_date => @course_date.attributes
    end

    assert_redirected_to course_date_path(assigns(:course_date))
  end

  test "should show course_date" do
    get :show, :id => @course_date.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @course_date.to_param
    assert_response :success
  end

  test "should update course_date" do
    put :update, :id => @course_date.to_param, :course_date => @course_date.attributes
    assert_redirected_to course_date_path(assigns(:course_date))
  end

  test "should destroy course_date" do
    assert_difference('CourseDate.count', -1) do
      delete :destroy, :id => @course_date.to_param
    end

    assert_redirected_to course_dates_path
  end
end
