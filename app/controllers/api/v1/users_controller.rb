class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:following, :followers]

  def index
    @users = User.all
    render json: @users
  end

  def following
    render json: @users.following
  end

  def followers
    render json: @users.followers
  end

  private

  def set_user
    @users = User.find_by_id(params[:id])
  end
end
