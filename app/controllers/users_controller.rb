class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @course = {}
    @users = User.all
    @users.each do |user|
      @course[user.id] = user_courseName(user.course_id)
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new_student(user_params)
    if @user.save
      if @user.course_id == 0
        render :text => 'Class NULL captured, fix me at model user.'
      else
        redirect_to @user, notice: 'User was successfully created'
      end
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.' 
      else
        render :edit
      end
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
    params.require(:user).permit(:user_email, :user_password, :user_name, :user_role, :course_id)
  end

  def user_courseName(id)
    Course.get_courseName(id)
  end
end
