class Api::V1::TweetsController < ApplicationController
  before_action :authenticate?, only: [:create]

  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  def create
    @tweet = current_api_v1_user.tweets.build(tweet_params)

    begin @tweet.save!
      render json: @tweet
    rescue => error
      render json: error
    end
  end

  private

  def tweet_params
    params.permit(:content)
  end
end
