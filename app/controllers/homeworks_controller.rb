class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  def mkdir(directory)
    token = directory.split('/')
    1.upto(token.size)  do |n|
      dir = token[0...n].join('/')
      Dir.mkdir(dir) unless Dir.exist? (dir)
    end
  end

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
  end

  # GET /homeworks/1/edit
  def edit
  end

  def create_homework
    @user = User.find(session[:user_id])
    @course = Course.find(params[:course_id])
  end

  def create
    @user = User.find(session[:user_id])
    @course = Course.find(params[:course_id])

    @homework = Homework.new
    @homework[:hw_name] = params[:hw_name]
    @homework[:hw_description] = params[:hw_description]
    due_time = DateTime.new(params[:time]["due_time(1i)"].to_i, 
                            params[:time]["due_time(2i)"].to_i,
                            params[:time]["due_time(3i)"].to_i,
                            params[:time]["due_time(4i)"].to_i,
                            params[:time]["due_time(5i)"].to_i)
    release_time = DateTime.new(params[:time]["release_time(1i)"].to_i, 
                            params[:time]["release_time(2i)"].to_i,
                            params[:time]["release_time(3i)"].to_i,
                            params[:time]["release_time(4i)"].to_i,
                            params[:time]["release_time(5i)"].to_i)
    @homework[:hw_release_time] = release_time 
    @homework[:hw_due_time] = due_time 
    @homework.save

    directory = './UPLOAD/' + @course.course_name + '/' + @homework[:hw_name] + '/'

    mkdir(directory)

    File.open(directory + 'input', "w") { |f| f.write(params[:testcase_input].read.force_encoding('UTF-8')) }
    File.open(directory + 'output', "w") { |f| f.write(params[:testcase_output].read.force_encoding('UTF-8')) }

    @courseToHomework = CourseToHomework.new
    @courseToHomework.course_id = params[:course_id]
    @courseToHomework.homework_id = @homework.id 
    @courseToHomework[:hw_test_case_dir] = directory
    @courseToHomework.save

    redirect_to "/show_instructor"
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_homework
    @homework = Homework.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def homework_params
    params.require(:homework).permit(:hw_name, :hw_description, :hw_release_time, :hw_due_time, :hw_test_case_dir)
  end
end
