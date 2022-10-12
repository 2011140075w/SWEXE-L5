class LikesController < ApplicationController
  before_action :login

  def create
    like = Like.create(user_id: @user.id, tweet_id: params[:tweet_id])
    redirect_to tweets_path
  end
  
  def destroy
    like = Like.find_by(user_id: @user.id, tweet_id: params[:id])
    like.destroy
    redirect_to tweets_path
  end

  private
  
  def login
    @user = User.find_by(uid: session[:login_uid]) if session[:login_uid]
    
    redirect_to root_path if @user.nil?
  end
end
