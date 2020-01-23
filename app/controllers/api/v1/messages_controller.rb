class Api::V1::MessagesController < ApplicationController
  before_action :authenticate?
  before_action :entry_room?
  before_action :set_messages, only: ["index"]
  before_action :set_room, only: ["create"]

  def index
    render json: { "messages": @messages }
  end

  def create
    begin
      message = @room.messages.new(
        message_params.merge({ user_id: current_api_v1_user.id })
      )
      message.save!
      render json: { "message": message }
    rescue => e
      render json: { "error": e }
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_messages
    limit = params[:limit].presence || 50
    @messages = Message.get_room_messages(limit)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
