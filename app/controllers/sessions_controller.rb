class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:current_user_id] = user.id
      flash.notice = "Loggin In!"
      redirect_to root_path
    else
      flash.now[:alert] = "Username not found!"
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_url
  end
end
