class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  def liked?(tweet)
    likes.exists?(tweet_id: tweet.id)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
end
