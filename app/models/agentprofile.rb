class Agentprofile < ActiveRecord::Base
  attr_accessible :adress, :description, :isactive, :isdelete, :name, :phone, :photourl, :region_id
  belongs_to :region
  has_many :accountabilityagent

  def self.findbypost(post_id)
  	#Agentprofile.joins(:accountabilityagent, :post).where("posts.id=accountabilityagent.post_id AND agentprofile.id=accountabilityagent.agenprofile_id AND posts.id='#{post_id}'")
  	#Agentprofile.joins(:accountabilityagent, :post).where("accountabilityagents.id=posts.id")
  	#Agentprofile.find_by_sql("SELECT accountabilityagents.id, agentprofiles.id, agentprofiles.name, agentprofiles.phone    FROM accountabilityagents, agentprofiles, posts WHERE accountabilityagents.post_id=posts.id AND accountabilityagents.agentprofile_id=agentprofiles.id AND posts.id='#{post_id}'")
  	Agentprofile.find_by_sql("SELECT accountabilityagents.id, agentprofiles.name, agentprofiles.phone    FROM accountabilityagents, agentprofiles, posts WHERE accountabilityagents.post_id=posts.id AND accountabilityagents.agentprofile_id=agentprofiles.id AND posts.id='#{post_id}'")

  end
end
