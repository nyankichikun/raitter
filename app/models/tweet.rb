class Tweet < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user

  def nice(user)
    favorites.create(user_id: user.id)
  end

  def unnice(user)
    favorites.find_by(user_id: user.id).destroy
  end
end
