class LoginSessionController < ApplicationController
  def new
    @user = User.new
  end

  # login func
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/recipes'
    else
        redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to '/recipes'
  end

end
