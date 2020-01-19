class Api::V1::RoomsController < ApplicationController
  before_action :authenticate?, only: [:index, :create]
  before_action :set_rooms,     only: [:index]
  before_action :set_room,      only: [:destroy]

  def index
    render json: { "rooms": @rooms }
  end

  def create
    begin
      room = Room.create(room_params)
      entry = Entry.create({ user_id: current_api_v1_user.id, room_id: room.id })
      render json: { "room": room, "entry": entry}
    rescue => e
      render json: { "error": e  }
    end
  end

  def destroy
    begin
      @room.destroy
      render json: { "delete room": @room }
    rescue => e
      render json: { "error": e }
    end
  end

  private

  def room_params
    params.permit(:name)
  end

  def set_rooms
    @rooms = current_api_v1_user.rooms
  end

  def set_room
    @room = current_api_v1_user.rooms.find_by_id(params[:id])
  end
end
