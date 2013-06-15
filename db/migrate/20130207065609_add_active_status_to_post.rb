class AddActiveStatusToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :isactive, :boolean
  end
end
