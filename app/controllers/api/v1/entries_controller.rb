class Api::V1::EntriesController < ApplicationController
  before_action :authenticate?
  before_action :set_room, only: ["create"]
  before_action :set_entries, only: ["index"]
  before_action :set_entry, only: ["destroy"]

  def index
    render json: { "entries": @entries }
  end

  def create
    begin
      render json: { "entry": @room.entries.where(user_id: current_api_v1_user.id).create }
    rescue => e
      render json: { "error": e }
    end
  end

  def destroy
    begin
      @entry.destroy
      render json: { "delete entry": @entry }
    rescue => e
      render json: { "error": e }
    end
  end

  private

  def set_entries
    @entries = current_api_v1_user.entries
  end

  def set_entry
    @entry = current_api_v1_user.entries.find_by_id(params[:id])
  end

  def set_room
    @room = Room.find_by_id(params[:room_id])
  end
end
