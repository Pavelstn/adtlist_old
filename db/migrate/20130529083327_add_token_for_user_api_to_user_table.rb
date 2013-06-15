class AddTokenForUserApiToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :isusetoken, :boolean, :default => 0
  	add_column :users, :token, :string
  	add_column :users, :create_token_at, :datetime
  	add_column :users, :expire_token_at, :datetime
  end
end
