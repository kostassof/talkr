class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true
  has_many :talks, dependent: :destroy
  has_many :likes
  has_many :liked_talks, through: :likes, source: :talk

  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships

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
end
