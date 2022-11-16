class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # sign up func
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      puts "Duplicated username. Redirect to Signup"  
      redirect_to '/signup'
    else
      @user = User.create(params.require(:user).permit(:username, :password))
      session[:user_id] = @user.id
      redirect_to '/recipes'
    end
 end
end
