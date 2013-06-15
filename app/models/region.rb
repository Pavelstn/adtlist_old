class Region < ActiveRecord::Base
  attr_accessible :alias, :name, :isdelete, :isactive
  has_many :post
  has_many :agentprofile

  def self.all_active()
		Region.where( :isactive=>1)
  end
end
