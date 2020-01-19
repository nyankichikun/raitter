class Api::V1::MessagesController < ApplicationController
  before_action :authenticate?
  before_action :set_messages, only: ["index"]
  before_action :entry_room?, only: ["show", "create"]
  before_action :set_room, only: ["show", "create"]

  def index
    render json: { "messages": @messages }
  end

  def show
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

  def entry_room?
    if Entry.where(user_id: current_api_v1_user, room_id: params[:room_id]).blank?
      return render json: { error: 'invalid request'}, status: 401
    end
    true
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_messages
    limit = params[:limit].presence || 50
    @messages = Message.recent_messages(limit)
  end

  #def set_user_message
  #  @user_messages = Message.user_message(current_api_v1_user)
  #end

  #def set_room_messages
  #  @room_messages = Message.room_messages(current_api_v1_user)
  #end

  def message_params
    params.require(:message).permit(:content)
  end
end
