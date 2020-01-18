class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_relationships,
    class_name:  "FollowRelationship",
    foreign_key: "follower_id",
    dependent:   :destroy
  has_many :passive_relationships,
    class_name:  "Relationship",
    foreign_key: "followed_id",
    dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower #この場合sourceは不要

  # device
  devise :database_authenticatable, :registerable,:recoverable,
    :rememberable, :trackable, :validatable, :lockable
    #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
