class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :post_id
      t.string :url
      t.integer :order
      t.integer :purpose_id

      t.timestamps
    end
  end
end
