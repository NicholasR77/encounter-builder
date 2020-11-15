class SessionsController < ApplicationController
  def new; end

  def create
    if auth
      user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.alert = 'Login succesful.'
        redirect_to root_path
      else
        flash.alert = 'Unable to validate your email or password. Please try again.'
        redirect_to login_path
      end
    end
  end

  def destroy
    flash.alert = 'Logout succesful.'
    session[:user_id] = nil
    redirect_to login_path
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end
