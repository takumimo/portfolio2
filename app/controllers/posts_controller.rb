class PostsController < ApplicationController
  def new
    @post = params[:post].present? ? Post.new(post_params) : Post.new
    @post.tag_list = params[:post].present? ? params[:post][:tag_list].split(',') : ""
    @post.emoji = params[:post].present? ? params[:post][:emoji] : "😄"
    @user = current_user
  end

  def confirm
    @post = Post.new(post_params)
  end

  def create
    @post = Post.new(post_params)
    @post.tag_list = params[:post][:tag_list]
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to user_path(current_user)
    else 
      render 'confirm'
    end
  end

  def index
    @all_ranking_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))

    @tags = Post.tag_counts_on(:tags).order('count desc')

    @q = Post.ransack(params[:q])
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").includes(:tags).order(created_at: :desc).page(params[:page]).per(10)
    elsif params[:q]
      @posts = @q.result.order(created_at: :desc).page(params[:page]).per(10)
    else
      @posts = Post.includes(:user).all.order(created_at: :desc).page(params[:page]).per(10)
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
    if @post.user == current_user
      render 'edit'
    else
      redirect_back(fallback_location: posts_path, notice: "URLが有効ではありません")
    end
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
    flash[:notice] = "削除しました"
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :text, :tag_list, :status, :emoji)
  end
end
