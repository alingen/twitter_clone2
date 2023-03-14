class RemoveTweetFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :likes, :tweets
    remove_reference :likes, :tweet, index: true
  end
end
