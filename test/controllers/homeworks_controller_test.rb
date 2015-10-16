require 'test_helper'

class HomeworksControllerTest < ActionController::TestCase
  setup do
    @homework = homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homework" do
    assert_difference('Homework.count') do
      post :create, homework: { hw_description: @homework.hw_description, hw_due_date: @homework.hw_due_date, hw_name: @homework.hw_name, hw_release_date: @homework.hw_release_date, hw_test_case_dir: @homework.hw_test_case_dir, user_id: @homework.user_id }
    end

    assert_redirected_to homework_path(assigns(:homework))
  end

  test "should show homework" do
    get :show, id: @homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homework
    assert_response :success
  end

  test "should update homework" do
    patch :update, id: @homework, homework: { hw_description: @homework.hw_description, hw_due_date: @homework.hw_due_date, hw_name: @homework.hw_name, hw_release_date: @homework.hw_release_date, hw_test_case_dir: @homework.hw_test_case_dir, user_id: @homework.user_id }
    assert_redirected_to homework_path(assigns(:homework))
  end

  test "should destroy homework" do
    assert_difference('Homework.count', -1) do
      delete :destroy, id: @homework
    end

    assert_redirected_to homeworks_path
  end
end
