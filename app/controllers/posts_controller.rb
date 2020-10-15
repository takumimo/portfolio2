class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  	@user = current_user
  end

  def confirm

  	@post = Post.new
  	@post.text = params[:post][:text]
  	
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  	redirect_to posts_path
  end



  def index
  	@posts = current_user.posts
  end

  def show
  	@post = Post.find(params[:id])
  	@posts = Post.all
  	@post_comment = PostComment.new
  end

  
  

  private
  	def post_params
  	 params.require(:post).permit(:user_id, :text)
  	end

end

