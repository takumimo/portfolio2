class LikesController < ApplicationController
	before_action :set_post

	def create
	    like = @post.likes.new(user_id: current_user.id)
		like.save
		redirect_to request.referrer
	end

	def destroy
	    like = current_user.likes.find_by(post_id: @post.id)
	    like.destroy
	    redirect_to request.referrer
	end

	private
	def set_post
		@post = Post.find(params[:post_id])
	end
end


