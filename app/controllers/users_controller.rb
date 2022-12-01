class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # sign up func
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      puts "Duplicated username. Redirect to Signup"  
      flash[:alert] = Array.new
      flash[:alert] << "Oops! This username has been used. Please try a different one. "
      redirect_to '/signup'
    else
      @user = User.create(params.require(:user).permit(:username, :password, :password_confirmation))
      if not @user.valid?
        puts @user.errors.full_messages
        flash[:alert] = @user.errors.full_messages.uniq
        redirect_to '/signup'
      else
        session[:user_id] = @user.id
        flash[:notice] = "Welcome! You have been successfully signed up."
        redirect_to '/recipes'
      end
      
    end
 end
end
