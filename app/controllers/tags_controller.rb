class TagsController < ApplicationController

	def create
		tag = @post.tags.new(post_id: @post.id)
		tag.save
	end


end
