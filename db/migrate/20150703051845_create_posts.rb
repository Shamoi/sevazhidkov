class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.attachment :image
      t.references :journal, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :journals
  end
end
