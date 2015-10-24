require 'test_helper'

class CourseToHomeworksControllerTest < ActionController::TestCase
  setup do
    @course_to_homework = course_to_homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_to_homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_to_homework" do
    assert_difference('CourseToHomework.count') do
      post :create, course_to_homework: { course_id: @course_to_homework.course_id, homework_id: @course_to_homework.homework_id }
    end

    assert_redirected_to course_to_homework_path(assigns(:course_to_homework))
  end

  test "should show course_to_homework" do
    get :show, id: @course_to_homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_to_homework
    assert_response :success
  end

  test "should update course_to_homework" do
    patch :update, id: @course_to_homework, course_to_homework: { course_id: @course_to_homework.course_id, homework_id: @course_to_homework.homework_id }
    assert_redirected_to course_to_homework_path(assigns(:course_to_homework))
  end

  test "should destroy course_to_homework" do
    assert_difference('CourseToHomework.count', -1) do
      delete :destroy, id: @course_to_homework
    end

    assert_redirected_to course_to_homeworks_path
  end
end
