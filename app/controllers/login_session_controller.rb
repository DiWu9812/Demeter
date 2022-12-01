class LoginSessionController < ApplicationController
  def new
    @user = User.new
  end

  # login func
  def create
    puts params
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        puts "session id"
        puts session[:user_id]
        flash[:notice] = "Welcome back! You have been successfully logged in."
        redirect_to '/recipes'
    else
        flash[:alert] = Array.new
        flash[:alert] << "Login failed..Please check your username and password again. "
        redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to '/recipes'
  end

end
