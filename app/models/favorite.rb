class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  scope :my_favorite, lambda {|user_id, tweet_id|
    where(user_id: user_id, tweet_id: tweet_id)
  }
end
