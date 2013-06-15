class NewsList < ActiveRecord::Base
  attr_accessible :img_url, :short_text, :text, :title, :user_id, :isdelete, :isactive

  def self.all_active()
		NewsList.where( :isactive=>1)
	end


end
