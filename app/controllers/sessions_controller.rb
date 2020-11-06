class SessionsController < ApplicationController
  def new; end

  def create
    if auth

    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to new_encounter_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end

  # def create
  #   user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #     u.image = auth['info']['image']
  #   end
 
  #   session[:user_id] = @user.id
 
  # end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end