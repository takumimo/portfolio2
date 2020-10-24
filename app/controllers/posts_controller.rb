class PostsController < ApplicationController
  def new
  	@post = Post.new
  	@user = current_user
  end

  def confirm

  	@post = Post.new
  	@post.text = params[:post][:text]
    @post.title = params[:post][:title]
    @post.tag_list = params[:post][:tag_list]
  end

  def create
    @post = Post.new(post_params)
   
    @post.save
     binding.pry
    redirect_to posts_path
  end

  def index
  	@posts = Post.all
    @tags = Post.tag_counts_on(:tags).order('count DESC')
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
  	 params.require(:post).permit(:user_id, :title, :text, :tag_list)
  	end

end

