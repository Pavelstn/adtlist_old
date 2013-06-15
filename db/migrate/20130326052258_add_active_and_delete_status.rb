class AddActiveAndDeleteStatus < ActiveRecord::Migration
 def change
  	add_column :categories, :isdelete, :boolean
  	add_column :categories, :isactive, :boolean
  end
end
