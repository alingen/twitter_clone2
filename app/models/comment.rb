class Comment < ApplicationRecord
  validates :text, {presence: true, length:{maximum:140}}

  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likeable
end
