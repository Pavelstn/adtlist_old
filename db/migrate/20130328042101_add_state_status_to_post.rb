class AddStateStatusToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :conditionbuilding, :string
  	add_column :posts, :apartmentstate, :string
  	add_column :posts, :balcony, :boolean
  	add_column :posts, :phone, :boolean
  end
end
