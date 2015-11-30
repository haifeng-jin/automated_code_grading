class CourseToUsersController < ApplicationController
  before_action :set_course_to_user, only: [:show, :edit, :update, :destroy]

  # GET /course_to_users
  # GET /course_to_users.json
  def index
    @course_to_users = CourseToUser.all
  end

  # GET /course_to_users/1
  # GET /course_to_users/1.json
  def show
  end

  # GET /course_to_users/new
  def new
    @course_to_user = CourseToUser.new
  end

  # GET /course_to_users/1/edit
  def edit
  end

  # POST /course_to_users
  # POST /course_to_users.json
  def create
    @course_to_user = CourseToUser.new(course_to_user_params)

    respond_to do |format|
      if @course_to_user.save
        format.html { redirect_to @course_to_user, notice: 'Course to user was successfully created.' }
        format.json { render :show, status: :created, location: @course_to_user }
      else
        format.html { render :new }
        format.json { render json: @course_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_to_users/1
  # PATCH/PUT /course_to_users/1.json
  def update
    respond_to do |format|
      if @course_to_user.update(course_to_user_params)
        format.html { redirect_to @course_to_user, notice: 'Course to user was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_to_user }
      else
        format.html { render :edit }
        format.json { render json: @course_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_to_users/1
  # DELETE /course_to_users/1.json
  def destroy
    @course_to_user.destroy
    respond_to do |format|
      format.html { redirect_to course_to_users_url, notice: 'Course to user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def drop_course
    course_to_user = CourseToUser.where(:course_id => params[:course_id], :user_id => params[:user_id]).first
    course_to_user.destroy if course_to_user
    redirect_to view_courses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_to_user
      @course_to_user = CourseToUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_to_user_params
      params.require(:course_to_user).permit(:course_id, :user_id)
    end
end
