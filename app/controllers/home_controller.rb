class HomeController < ApplicationController
  def top
    @tweets = Tweet.order(created_at: :desc)
  end
end
