class CommentsController < ApplicationController
  before_action :set_tweet, only: %i[new, create]

  def new
    @comments = Comment.new
  end

  def create
    @comment = current_user.comments.build(tweet_id: @tweet.id, text: params[:text])
    if @comment.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
