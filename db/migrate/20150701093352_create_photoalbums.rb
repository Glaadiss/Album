class CreatePhotoalbums < ActiveRecord::Migration
  def change
    create_table :photoalbums do |t|
      t.string :name
      t.text :info
      t.references :user, index: true
      t.string :avatar
      t.boolean :private?

      t.timestamps null: false
    end
    add_foreign_key :photoalbums, :users
  end
end
