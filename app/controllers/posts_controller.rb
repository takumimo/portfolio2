class PostsController < ApplicationController
  def new
    @post = params[:post].present? ? Post.new(post_params) : Post.new
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
    redirect_to posts_path
  end

  def index
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))

    @q = Post.ransack(params[:q])
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").includes(:tags)
    elsif
      @posts = @q.result
    else
      @posts = Post.all.includes(:tags)
    end
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :text, :tag_list)
  end
end
