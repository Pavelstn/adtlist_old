class AddIsactiveStatusToRegion < ActiveRecord::Migration
  def change
  	add_column :regions, :isdelete, :boolean
  	add_column :regions, :isactive, :boolean
  end
end
