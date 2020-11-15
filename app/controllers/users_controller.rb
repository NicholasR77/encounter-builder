class UsersController < ApplicationController
  before_action :check_logged_in, only: [:show]
  before_action :require_permission, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash.alert = 'Account created succesfully. Please log in.'
      redirect_to login_path
    else
      flash.alert = 'Account creation failed.'
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def require_permission
    unless current_user.id == User.find(params[:id]).id
      flash[:danger] = 'You do not have access to this page.'
      redirect_to root_path
    end
  end
end
