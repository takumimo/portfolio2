class TagsController < ApplicationController

	def create
		@post = current_post
		@tag = @post.tags.build(tag_params)
		@tag.save
	end

	private
	def tag_params
		params.require(:tag).permit(:name)
	end


end





