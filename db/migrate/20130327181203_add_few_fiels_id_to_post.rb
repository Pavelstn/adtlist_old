class AddFewFielsIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :district, :string
  	add_column :posts, :space, :string
  	add_column :posts, :floor, :string
  	add_column :posts, :material, :string
  	add_column :posts, :plan, :string
  	add_column :posts, :year, :string
  end
end
