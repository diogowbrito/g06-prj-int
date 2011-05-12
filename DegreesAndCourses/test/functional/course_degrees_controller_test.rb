require 'test_helper'

class CourseDegreesControllerTest < ActionController::TestCase
  setup do
    @course_degree = course_degrees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_degrees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_degree" do
    assert_difference('CourseDegree.count') do
      post :create, :course_degree => @course_degree.attributes
    end

    assert_redirected_to course_degree_path(assigns(:course_degree))
  end

  test "should show course_degree" do
    get :show, :id => @course_degree.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @course_degree.to_param
    assert_response :success
  end

  test "should update course_degree" do
    put :update, :id => @course_degree.to_param, :course_degree => @course_degree.attributes
    assert_redirected_to course_degree_path(assigns(:course_degree))
  end

  test "should destroy course_degree" do
    assert_difference('CourseDegree.count', -1) do
      delete :destroy, :id => @course_degree.to_param
    end

    assert_redirected_to course_degrees_path
  end
end
