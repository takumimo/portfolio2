class PostsController < ApplicationController
  def index
  	@posts = current_user.posts
  end

  def new
  	@post = Post.new
  end

  def confirm

  	@post = Post.new
  	@post.text = params[:post][:text]
  	@post.valid?
  	redirect_to new_post_path
  	
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  	redirect_to posts_path
  end

  private
  	def post_params
  	 params.require(:post).permit(:user_id, :text)
  	end

end

