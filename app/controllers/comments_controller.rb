class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = current_user.comments.build(tweet_id: params[:id], text: params[:text])
    if @comment.save
      redirect_to tweet_path(params[:id])
    else
      render :new
    end
  end
end
