class TweetsController < ApplicationController
  def new
  end

  def create
    @tweet = current_user.tweets.build(user_id: current_user.id, text: params[:text])
    if @tweet.save
      flash[:notice] = "投稿を作成しました"
      redirect_to root_path
    else
      render("tweets/new")
    end
  end
  
end
