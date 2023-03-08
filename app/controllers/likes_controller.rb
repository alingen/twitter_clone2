class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.build(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.save
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    redirect_to root_path
  end
end
