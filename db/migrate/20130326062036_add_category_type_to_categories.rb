class AddCategoryTypeToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :type_id, :integer
  	add_column :categories, :private_name, :string
  end
end
