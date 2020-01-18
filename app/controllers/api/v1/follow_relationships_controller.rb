class Api::V1::FollowRelationshipsController < ApplicationController
  before_action :authenticate?, only: [:create, :destroy]

  def create
    user = User.find_by_uid(params[:uid])

    if !current_api_v1_user.following?(user)
      current_api_v1_user.follow(user)
      render json: { "follow": user }
    else
      render json: { "error": "already following", "user": user }
    end
  end

  def destroy
    follow_relationship = FollowRelationship.find_by_id(params[:id])

    return render json: { "error": "not following" } if follow_relationship.blank?

    user  = follow_relationship.followed

    if current_api_v1_user.following?(user)
      current_api_v1_user.unfollow(user)
      render json: { "unfollow": user }
    else
      render json: { "error": "not following", "user": user }
    end
  end
end
