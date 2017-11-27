class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true
  has_many :talks, dependent: :destroy
  has_many :likes
  has_many :liked_talks, through: :likes, source: :talk

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
end
