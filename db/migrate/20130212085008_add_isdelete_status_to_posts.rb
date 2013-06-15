class AddIsdeleteStatusToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :isdelete, :boolean
  end
end
