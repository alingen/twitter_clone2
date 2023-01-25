class TweetsController < ApplicationController
  def new
  end

  def create
    @tweet = current_user.tweets.build(text: params[:text])
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
  end
  
end
