class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :controller => 'users', :action => 'show_student'
    else render 'new'
    end
  end
end
