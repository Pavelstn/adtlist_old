class CreateAccountabilityagents < ActiveRecord::Migration
  def change
    create_table :accountabilityagents do |t|
      t.integer :post_id
      t.integer :agentprofile_id

      t.timestamps
    end
  end
end
