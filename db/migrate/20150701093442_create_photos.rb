class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :info
      t.references :photoalbum, index: true
      t.string :avatar

      t.timestamps null: false
    end
    add_foreign_key :photos, :photoalbums
  end
end
