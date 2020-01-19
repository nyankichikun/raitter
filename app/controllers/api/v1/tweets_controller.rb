class Api::V1::TweetsController < ApplicationController
  before_action :authenticate?, only: [:index, :create]
  before_action :set_timeline,  only: [:index]

  def index
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

  def set_timeline
    @tweets = Tweet.timeline(current_api_v1_user.following)
  end

  def tweet_params
    params.permit(:content)
  end
end
