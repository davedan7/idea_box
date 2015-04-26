class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user #ask about this
    else
      flash[:errors] = "Invalid Login"
      render :new
    end

  end

  def destroy
    session.clear
    flash[:notice] = "Peace out, session"
    redirect_to login_path
  end
  
end