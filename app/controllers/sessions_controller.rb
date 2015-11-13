class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.get_user(params[:session][:login_credential].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
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

