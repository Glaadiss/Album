class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.boolean :dislike
      t.references :user, index: true
      t.references :photoalbum, index: true
      t.references :photo, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users
    add_foreign_key :likes, :photoalbums
    add_foreign_key :likes, :photos
    add_foreign_key :likes, :comments
  end
end
