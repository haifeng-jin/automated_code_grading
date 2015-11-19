class SessionsController < ApplicationController
  def new
    if session[:user_id]
      user = User.find_by id: session[:user_id]
      if user and user.user_role == 'student'
        redirect_to :controller => 'users', :action => 'show_student'
      elsif user and user.user_role == 'instructor'
        redirect_to :controller => 'users', :action => 'show_instructor'
      end
    end
  end

  def create
    user = User.get_user(params[:session][:login_credential].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user_role] = user.user_role
      if user.user_role == 'student'
        redirect_to :controller => 'users', :action => 'show_student'
      elsif user.user_role == 'instructor'
        redirect_to :controller => 'users', :action => 'show_instructor'
      else
        render plain: 'User role can not be identified, please contact admin' 
      end
    else render 'new'
    end
  end

  def destroy
    reset_session
    render 'new'
  end

end

