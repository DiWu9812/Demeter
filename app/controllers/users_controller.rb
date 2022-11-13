class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # sign up func
  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/recipes'
 end
end
