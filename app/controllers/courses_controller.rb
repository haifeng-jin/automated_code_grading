class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end


  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new
    @course[:course_name] = params[:course_name]
    respond_to do |format|
      if @course.save
        CourseToUser.new(course_id: @course.id, user_id: session[:user_id]).save
        User.get_students.each do |stu|
          if params["select_stu_#{stu.id}"] == "on"
            CourseToUser.new(course_id: @course.id, user_id: stu.id).save
          end
        end

        Homework.all.each do |hw|
          if params["select_stu_#{hw.id}"] == "on"
            CourseToHomework.new(course_id: @course.id, homework_id: hw.id).save
          end
        end


        format.html { redirect_to "/show_instructor" }
        format.json { render :show, status: :created, location: @course }

      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /create_course
  def create_course
    if session[:user_role] != 'instructor'
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
      @students = User.get_students
      @homeworks = Homework.all
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :user_id)
    end
end
