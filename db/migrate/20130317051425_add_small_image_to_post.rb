class AddSmallImageToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :imageurl, :string
  end
end
