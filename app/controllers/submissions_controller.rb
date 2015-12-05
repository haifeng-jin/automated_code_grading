
class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    #@submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  def display_submission
    path = Rails.root.to_s + '/' + params[:path]
    send_file path 
  end

  def time_diff_string(diff_sec)
    mm, ss = diff_sec.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    diff_string = "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
    return diff_string
  end

  # Home submission for students
  def submit_homework
    @user = User.find(session[:user_id])
    @course = Course.find(params[:course_id])
    @homework = Homework.find(params[:homework_id])
    @time_left = time_diff_string(@homework.hw_due_time - Time.zone.now)
  end

  def submission_history
    @username = User.find(session[:user_id]).user_name
    @submissions = Submission.where(:user_id => session[:user_id]).where(:course_id => params[:course_id]).where(:homework_id => params[:homework_id])
    @homework = Homework.find(params[:homework_id])
  end

  #  instructor view student's submission history
  def all_submission_history
    if session[:user_role] != 'instructor'
      redirect_to login_path
    else
    @user = User.find(session[:user_id])
    @submissions = Submission.where(:course_id => params[:course_id]).where(:homework_id => params[:homework_id])
    @homework = Homework.find(params[:homework_id])
    end
  end

  def specific_stu_hw_submissions
    if session[:user_role] != 'instructor'
      redirect_to login_path
    else
    @user = User.find(session[:user_id])
    @submissions = Submission.where(:user_id => params[:student_id]).where(:homework_id => params[:homework_id])
    @homework = Homework.find(params[:homework_id])
    @student = User.find(params[:student_id])
    end
  end

  def mkdir(directory)
    token = directory.split('/')
    1.upto(token.size)  do |n|
      dir = token[0...n].join('/')
      Dir.mkdir(dir) unless Dir.exist? (dir)
    end
  end

  def create
    @user = User.find(session[:user_id])
    @course = Course.find(params[:course_id])
    @homework = Homework.find(params[:homework_id])
    num_submission = Submission.where(:user_id => session[:user_id]).where(:course_id => params[:course_id]).where(:homework_id => params[:homework_id]).size 

    current_time = Time.new
    time = current_time.strftime('%Y_%m_%d-%H_%M_%S')
    file_type = params[:file].original_filename.partition('.')[-1]
    file_name = time + '.' + file_type
    file_name = file_name.tr(' ','_')

    directory = './UPLOAD/' + @course.course_name + '/' + @homework.hw_name + '/' + @user.user_login_name + '/' + num_submission.to_s
    directory = directory.tr(' ','_')

    path_file = File.join(directory, file_name)

    mkdir(directory)

    File.open(path_file, "w") { |f| f.write(params[:file].read.force_encoding('UTF-8')) }

    @submission = Submission.new
    @submission[:homework_id] = params[:homework_id]
    @submission[:user_id] = session[:user_id]
    @submission[:course_id] = params[:course_id]

    @courseToHomework = CourseToHomework.find_by(:course_id => params[:course_id], :homework_id => params[:homework_id])
    
    ## Copy the submission to `main.java` for compile and execuate   
    #`cp #{Rails.root.to_s + '/' + path_file} #{Rails.root.to_s + '/' + directory + '/main.java'}`

    testcase_path = Rails.root.to_s + '/' + @courseToHomework.hw_test_case_dir + '/'
    ext_string = File.extname(path_file)
    if ext_string == ".java"
      grading_result = ExecutorFactory.get_executor(Rails.root.to_s + '/' + directory, "java", Rails.root.to_s + '/' + path_file, testcase_path + 'input', testcase_path + 'output').execute
    else# if ext_string == ".py"
      grading_result = ExecutorFactory.get_executor(Rails.root.to_s + '/' + directory, "python", Rails.root.to_s + '/' + path_file, testcase_path + 'input', testcase_path + 'output').execute
    end
    @submission[:sm_grade] = grading_result.get_score
    @submission[:sm_judgement] = grading_result.get_judgement
    @submission[:sm_src_dir] = path_file

    @submission.save

    redirect_to "/show_student"
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def submission_params
    params.require(:submission).permit(:homework_id, :user_id, :course_id, :sm_grade, :sm_time, :sm_src_dir)
  end
end
