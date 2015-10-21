require 'test_helper'

class CourseHasHomeworksControllerTest < ActionController::TestCase
  setup do
    @course_has_homework = course_has_homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_has_homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_has_homework" do
    assert_difference('CourseHasHomework.count') do
      post :create, course_has_homework: { course_id: @course_has_homework.course_id, homework_id: @course_has_homework.homework_id }
    end

    assert_redirected_to course_has_homework_path(assigns(:course_has_homework))
  end

  test "should show course_has_homework" do
    get :show, id: @course_has_homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_has_homework
    assert_response :success
  end

  test "should update course_has_homework" do
    patch :update, id: @course_has_homework, course_has_homework: { course_id: @course_has_homework.course_id, homework_id: @course_has_homework.homework_id }
    assert_redirected_to course_has_homework_path(assigns(:course_has_homework))
  end

  test "should destroy course_has_homework" do
    assert_difference('CourseHasHomework.count', -1) do
      delete :destroy, id: @course_has_homework
    end

    assert_redirected_to course_has_homeworks_path
  end
end
