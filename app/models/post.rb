class Post < ActiveRecord::Base
	attr_accessible :altname, :category_id, :contact, :price, :region_id, :tags, :text, :title, :user_id, :isactive ,:isdelete, :ontop, :imageurl, :partner_id, :district, :space, :floor, :material, :plan, :year, :conditionbuilding, :apartmentstate, :balcony, :phone
	has_many :image
	belongs_to :region
	has_many :accountabilityagent
	belongs_to :category
	belongs_to :review
	belongs_to :partner
	has_many :stat

	scope :postisdelete, where("isdelete IS NULL")

	scope :postontop, where(:ontop => 1)
	scope :postonnottop, where("ontop IS NULL OR ontop =0")

	scope :postisactive, where(:isactive => 1)
	scope :postisunactive, where("isactive IS NULL OR isactive =0")

	scope :postregion, lambda { |id| region_by_id(id) }
	scope :postcategory, lambda { |id| category_by_id(id) }

	def self.all_active()
		Post.where( :isactive=>1)
	end

	def self.region_active_by_altname(aliasname)
		Post.joins(:region).where("posts.region_id=regions.id AND regions.alias='#{aliasname}' AND posts.isactive= #{true} AND NOT posts.isdelete IS true")
		#Post.where( :isactive=>1)
	end

	def self.region_active_by_id(id)
		Post.where(:isactive=>1,:region_id=> id)
	end

	def self.category_active(aliasname)
		Post.joins(:category).where("posts.category_id=categories.id AND categories.alias='#{aliasname}' AND posts.isactive= #{true} AND NOT posts.isdelete IS true")
		#Post.where( :isactive=>1)
	end

	def self.ontop()
		Post.where( :isactive=>1, :ontop=>1)
	end

	def self.region_category_active_by_altname(region_aliasname, category_aliasname)
		Post.joins(:category,:region).where("posts.region_id=regions.id AND posts.category_id=categories.id AND regions.alias='#{region_aliasname}' AND categories.alias='#{category_aliasname}' AND posts.isactive= #{true} AND NOT posts.isdelete IS true")

	end

	def self.region_by_id(id)
		Post.where(:region_id=> id)
	end

	def self.category_by_id(id)
		Post.where(:category_id=> id)
	end


end
