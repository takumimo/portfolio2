class PostCommentsController < ApplicationController
  before_action :set_post_comment


  def create
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    comment = PostComment.find(params[:post_comment_id])
    comment.destroy
  end

  private
  def set_post_comment
    @post = Post.find(params[:post_id])
  end

  def post_comment_params
  	params.require(:post_comment).permit(:text)
  end
end



