class AddOntopStatusToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :ontop, :boolean
  end
end
