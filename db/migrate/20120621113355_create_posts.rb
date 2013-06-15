class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :region_id
      t.integer :category_id
      t.string :altname
      t.string :title
      t.text :text
      t.string :contact
      t.string :tags
      t.float :price

      t.timestamps
    end
  end
end
