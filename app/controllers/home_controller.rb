class HomeController < ApplicationController
  def top
    @tweets = Tweet.order(id: :desc)
  end
end
