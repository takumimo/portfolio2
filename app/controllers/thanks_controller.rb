class ThanksController < ApplicationController


	def create
		@post_comment = PostComment.find(params[:post_comment_id])
	    thank = Thank.new(user_id: current_user.id)
		thank.user_id = current_user.id
		thank.post_comment_id = @post_comment.id
		thank.save
		redirect_to request.referrer
	end

	def destroy
		@post_comment = PostComment.find(params[:post_comment_id])
	    thank = current_user.thanks.find_by(post_comment_id: @post_comment.id)
	    thank.destroy
	    redirect_to request.referrer
	end

	
end
