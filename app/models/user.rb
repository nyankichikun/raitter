class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_secure_password
end
