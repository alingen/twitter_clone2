class CommentsController < ApplicationController
  def show
    @tweet = Tweet.find_by(id: params[:id])
    @comments = Comment.where(tweet_id: @tweet.id)
  end

  def new
  end

  def create
    @comment = current_user.comments.build(tweet_id: params[:id], text: params[:text])
    if @comment.save
      redirect_to comment_path
    else
      render :new
    end
  end
end
