class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:following, :followers]

  def index
    @users = User.all
    render json: @users
  end

  def following
    @users = current_user.following
    render json: @users
  end

  def followers
    @users = current_user.followers
    render json: @users
  end
end
