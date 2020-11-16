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
      flash.alert = 'Account creation failed. Please try again.'
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:danger] = 'Account updated succesfully.'
      redirect_to user_path(user)
    else
      flash[:danger] = 'Account update failed. Please try again.'
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      session[:user_id] = nil
      flash.alert = 'Account deleted succesfully.'
      redirect_to root_path
    else
      flash.alert = 'Account deletion failed. Please try again.'
      redirect_to edit_user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def require_permission
    unless helpers.current_user.id == User.find(params[:id]).id
      flash[:danger] = 'You do not have access to this page.'
      redirect_to root_path
    end
  end
end
