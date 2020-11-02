class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if helpers.logged_in?
      redirect_to new_encounter_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_encounter_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
