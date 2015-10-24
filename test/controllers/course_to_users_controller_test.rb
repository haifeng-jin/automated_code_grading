require 'test_helper'

class CourseToUsersControllerTest < ActionController::TestCase
  setup do
    @course_to_user = course_to_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_to_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_to_user" do
    assert_difference('CourseToUser.count') do
      post :create, course_to_user: { course_id: @course_to_user.course_id, user_id: @course_to_user.user_id }
    end

    assert_redirected_to course_to_user_path(assigns(:course_to_user))
  end

  test "should show course_to_user" do
    get :show, id: @course_to_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_to_user
    assert_response :success
  end

  test "should update course_to_user" do
    patch :update, id: @course_to_user, course_to_user: { course_id: @course_to_user.course_id, user_id: @course_to_user.user_id }
    assert_redirected_to course_to_user_path(assigns(:course_to_user))
  end

  test "should destroy course_to_user" do
    assert_difference('CourseToUser.count', -1) do
      delete :destroy, id: @course_to_user
    end

    assert_redirected_to course_to_users_path
  end
end
