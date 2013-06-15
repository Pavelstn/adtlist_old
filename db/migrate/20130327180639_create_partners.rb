class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :aliasname
      t.text :description
      t.boolean :isactive
      t.boolean :isdelete

      t.timestamps
    end
  end
end
