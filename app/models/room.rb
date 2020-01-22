class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries

  scope :private_rooms, -> { where(public: false) }
  scope :public_rooms,  -> { where(public: true) }
end
