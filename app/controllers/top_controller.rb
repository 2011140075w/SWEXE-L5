class TopController < ApplicationController
  def main
    if session[:login_uid]
      redirect_to '/tweets'
    else
      render 'login'
    end
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid] 
      redirect_to root_path
    else
      render 'error'
    end
  end
  
  def pre_signin
    render 'signin'
  end
  
  def signin
    user = User.new(uid: params[:uid], 
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:login_uid] = params[:uid] 
      redirect_to root_path
    else
      render 'error'
    end
  end
  
  def logout
    session.delete(:login_uid)     
    redirect_to root_path
  end
end
