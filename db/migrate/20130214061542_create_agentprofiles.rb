class CreateAgentprofiles < ActiveRecord::Migration
  def change
    create_table :agentprofiles do |t|
      t.integer :region_id
      t.boolean :isactive
      t.boolean :isdelete
      t.string :name
      t.string :phone
      t.string :adress
      t.text :description
      t.string :photourl

      t.timestamps
    end
  end
end
