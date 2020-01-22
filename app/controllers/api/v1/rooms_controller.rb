class Api::V1::RoomsController < ApplicationController
  before_action :authenticate?, only: [:index, :create]
  before_action :set_rooms,     only: [:index]
  before_action :set_room,      only: [:destroy]

  def index
    render json: { "rooms": @rooms }
  end

  def create
    if private_room?
      begin
        raise "already exists" if invalid_private_room_request?(User.find_by_id(params[:user_id]))
        room = Room.create(room_params)
        entry1 = Entry.create({ user_id: current_api_v1_user.id, room_id: room.id })
        entry2 = Entry.create({ user_id: params[:user_id]     , room_id: room.id })
        return render json: { "room": room }
      rescue => e
        return render json: { "error": e  }
      end

    elsif public_room?
      begin
        room = Room.create(room_params)
        entry = Entry.create({ user_id: current_api_v1_user.id, room_id: room.id })
        return render json: { "room": room }
      rescue => e
        return render json: { "error": e  }
      end
    else
      return render json: { "error": "request is invalid"}
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

  def set_rooms
    @rooms = current_api_v1_user.rooms
  end

  def set_room
    @room = current_api_v1_user.rooms.find_by_id(params[:id])
  end

  def private_room?
    params[:user_id].present?
  end

  def public_room?
    params[:public] == 'true'
  end

  def room_params
    params.permit(:name, :public)
  end

  def invalid_private_room_request?(user)
    return true if current_api_v1_user.rooms.where(id: user.rooms).exists?
    false
  end
end
