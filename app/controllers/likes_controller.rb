class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.save
      redirect_to root_path
    else
      render "home/top"
    end
  end

  def destroy
    @like = current_user.likes.find_by!(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.destroy
      redirect_to root_path
    else
      render "home/top"
    end
  end
end
