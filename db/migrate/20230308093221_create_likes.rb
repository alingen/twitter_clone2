class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|

      t.references :likeable, polymorphic: true
      t.timestamps
    end
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :tweet, foreign_key: true
  end
end
