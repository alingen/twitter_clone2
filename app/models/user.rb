class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
end
