class ApplicationController < ActionController::Base

  def logged_in?
    session[:current_user_id] != nil
  end


  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in"
      redirect_to login_path
    end
  end

end
