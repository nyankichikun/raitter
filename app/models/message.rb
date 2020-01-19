class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  scope :recent_messages, lambda {|limit|
    Message.order("created_at DESC").limit(limit)
  }

  #scope :user_messages, lambda {|user_id|
  #  Message.where(user_id: user_id)
  #}

  #scope :room_messages, lambda {|room_id|
  #  Message.where(room_id: room_id)
  #}
end
