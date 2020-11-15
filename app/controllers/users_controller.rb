class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show; end

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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
