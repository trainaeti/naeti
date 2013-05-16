require 'test_helper'

class CourseCategoriesControllerTest < ActionController::TestCase
  setup do
    @course_category = course_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_category" do
    assert_difference('CourseCategory.count') do
      post :create, :course_category => @course_category.attributes
    end

    assert_redirected_to course_category_path(assigns(:course_category))
  end

  test "should show course_category" do
    get :show, :id => @course_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @course_category.to_param
    assert_response :success
  end

  test "should update course_category" do
    put :update, :id => @course_category.to_param, :course_category => @course_category.attributes
    assert_redirected_to course_category_path(assigns(:course_category))
  end

  test "should destroy course_category" do
    assert_difference('CourseCategory.count', -1) do
      delete :destroy, :id => @course_category.to_param
    end

    assert_redirected_to course_categories_path
  end
end
