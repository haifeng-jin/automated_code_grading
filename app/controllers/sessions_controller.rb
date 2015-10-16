class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      render :text => user.user_name + " Login successfully"
    else render 'new'
    end
  end
end
