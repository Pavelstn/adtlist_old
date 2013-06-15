class AddPartnerIdToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :partner_id, :integer
  end
end
