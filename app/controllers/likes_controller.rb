class LikesController < ApplicationController
  before_action :login

  def create
    tweet = Tweet.find(params[:tweet_id])
    unless tweet.liked?(@user)
      tweet.like(@user)
    end
    
    redirect_to tweets_path
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.liked?(@user)
      tweet.unlike(@user)
    end

    redirect_to tweets_path
  end

  private
  
  def login
    @user = current_user
    
    redirect_to root_path if @user.nil?
  end
end
