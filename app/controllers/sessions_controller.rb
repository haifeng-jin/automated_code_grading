class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.get_user(params[:session][:login_credential].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :controller => 'users', :action => 'show_student'
    else render 'new'
    end
  end
end
