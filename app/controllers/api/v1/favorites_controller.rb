class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate?, only: [:create, :destroy]

  def create
    tweet = Tweet.find_by_id(params[:tweet_id])

    if tweet.blank?
      return render json: { "error": "There is no such tweet", "tweet_id": params[:tweet_id] }
    end

    if Favorite.my_favorite(current_api_v1_user.id, tweet.id).exists?
      return render json: { "error": "already favorite tweet", "tweet_id": params[:tweet_id] }
    end

    render json: { "favorite": tweet.nice(current_api_v1_user) }
  end

  def destroy
    favorite = Favorite.find_by_id(params[:id])

    if favorite.blank?
      return render json: { "error": "There is no such favorite", "favorite_id": params[:id] }
    end

    if Favorite.my_favorite(current_api_v1_user.id, favorite.tweet.id).blank?
      return render json: { "error": "not nice yes", "tweet_id": favorite.tweet.id }
    end

    render json: { "favorite": favorite.tweet.unnice(current_api_v1_user) }
  end
end
