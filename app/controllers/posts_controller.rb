class PostsController < ApplicationController
  def new
  	@post = Post.new
  	@user = current_user
    @tag = @post.tags.new
  end

  def confirm

  	@post = Post.new
  	@post.text = params[:post][:text]
    @post.title = params[:post][:title]
    byebug
    @name = params[:post][:tags_attributes][:name]
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  	@post_comment = PostComment.new
    @post_comments = @post.post_comments.order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
  	def post_params
  	 params.require(:post).permit(:user_id, :title, :text, tags_attributes:[:name])
  	end

end

