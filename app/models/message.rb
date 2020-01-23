class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :get_room_messages, lambda {|limit|
    Message.order("created_at DESC").limit(limit)
  }
end
