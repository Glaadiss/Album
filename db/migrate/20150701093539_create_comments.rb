class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :info
      t.references :user, index: true
      t.references :photoalbum, index: true
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :photoalbums
    add_foreign_key :comments, :photos
  end
end
