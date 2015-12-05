class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
  end

  def show_student
    if(session[:user_id].nil?)
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
      @first_course = @user.courses.first
    end
  end

  def show_instructor
    if(session[:user_id].nil?)
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
      @students = User.get_students
      if @user.user_role != 'instructor'
        reset_session
        redirect_to login_path
      end
    end
  end

  def view_student
    @user = User.find(session[:user_id])
    # @courses = Course.all

    @filtered_courses = Hash.new

    if params[:commit] == 'Submit'
      @students = Set.new
      @user.courses.each do |course|
        if params["course_#{course.id}"]
          @students = @students + User.get_student_by_course(course.id)
          @filtered_courses[course.id] = true
        end
      end
    elsif params[:commit] == 'Search'
      @students = Set.new
      @user.courses.each do |course|
        if params["hidden_course_#{course.id}"]
          if params[:search_type] == "ID"
            @students = @students + course.users.get_student_by_id(params[:search_val])
          elsif params[:search_type] == "Name"
            students = course.users.get_student_by_name(params[:search_val])
            @students = @students + students
          elsif params[:search_type] == "E-mail"
            @students = @students + course.users.get_student_by_email(params[:search_val])
          end

          @filtered_courses[course.id] = true
        end
      end

      @search_type = params[:search_type]
      @search_val = params[:search_val]

    else
      @user.courses.each do |course|
        @filtered_courses[course.id] = true
      end
      @students = User.get_students
    end
    if @user.user_role != 'instructor'
      redirect_to show_student_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new_student(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:user_email,:user_login_name, :user_password, :user_name, :user_role, :course_id)
  end

  #  def user_courseName(id)
  #    Course.get_courseName(id)
  #  end
end
