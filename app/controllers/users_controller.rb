class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:success] = 'Sign Up successful, please login to continue!'
    redirect_to login_path
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
