class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :valid_user
  helper_method :logged?
  def valid_user    
    User.find_by(id: session[:user_id])  
  end

  def logged?   
    !valid_user.nil?  
  end

end
