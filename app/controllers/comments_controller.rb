class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create
    if @tweet = Tweet.find(params[:tweet_id])
      @comment = current_user.comments.build(tweet_id: params[:tweet_id], text: params[:text])
    end
    if @comment.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end
end
