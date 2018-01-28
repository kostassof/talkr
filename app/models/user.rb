class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true
  has_many :talks, dependent: :destroy
  has_many :likes
  has_many :liked_talks, through: :likes, source: :talk

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followers, through: :following_relationships

  def like(talk)
    liked_talks << talk
  end

  def unlike(talk)
    liked_talks.destroy(talk)
  end

  def liked?(talk)
    liked_talk_ids.include?(talk.id)
  end

  def to_param
    username
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def timeline_talks
    Talk.where(user_id: followed_user_ids + [id])
  end
end
