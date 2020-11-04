class ThanksController < ApplicationController
	before_action :set_post_comment

	def create
	    thank = @post_comment.thanks.new(post_comment_id: @post_comment.id)
		thank.save
		redirect_to request.referrer
	end

	def destroy
	    thank = current_user.thanks.find_by(post_comment_id: @post_comment.id)
	    like.destroy
	    redirect_to request.referrer
	end

	private
	def set_post_comment
		@post_comment = PostComment.find(params[:post_comment_id])
	end
end
