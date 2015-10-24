class CourseToHomeworksController < ApplicationController
  before_action :set_course_to_homework, only: [:show, :edit, :update, :destroy]

  # GET /course_to_homeworks
  # GET /course_to_homeworks.json
  def index
    @course_to_homeworks = CourseToHomework.all
  end

  # GET /course_to_homeworks/1
  # GET /course_to_homeworks/1.json
  def show
  end

  # GET /course_to_homeworks/new
  def new
    @course_to_homework = CourseToHomework.new
  end

  # GET /course_to_homeworks/1/edit
  def edit
  end

  # POST /course_to_homeworks
  # POST /course_to_homeworks.json
  def create
    @course_to_homework = CourseToHomework.new(course_to_homework_params)

    respond_to do |format|
      if @course_to_homework.save
        format.html { redirect_to @course_to_homework, notice: 'Course to homework was successfully created.' }
        format.json { render :show, status: :created, location: @course_to_homework }
      else
        format.html { render :new }
        format.json { render json: @course_to_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_to_homeworks/1
  # PATCH/PUT /course_to_homeworks/1.json
  def update
    respond_to do |format|
      if @course_to_homework.update(course_to_homework_params)
        format.html { redirect_to @course_to_homework, notice: 'Course to homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_to_homework }
      else
        format.html { render :edit }
        format.json { render json: @course_to_homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_to_homeworks/1
  # DELETE /course_to_homeworks/1.json
  def destroy
    @course_to_homework.destroy
    respond_to do |format|
      format.html { redirect_to course_to_homeworks_url, notice: 'Course to homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_to_homework
      @course_to_homework = CourseToHomework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_to_homework_params
      params.require(:course_to_homework).permit(:course_id, :homework_id)
    end
end
