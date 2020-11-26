class PostsController < ApplicationController
  def new
    @post = params[:post].present? ? Post.new(post_params) : Post.new
    @post.tag_list = params[:post].present? ? params[:post][:tag_list].split(',') : ""
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
    @post.tag_list = params[:post][:tag_list]
    @post.save
    redirect_to user_path(current_user)
  end

  def index
    @all_ranking_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    # select user_id, sum(thanks.like_count) as sum_like_count from post_comments left join
    #    (select post_comment_id, count(post_comment_id) as like_count from thanks group by post_comment_id) AS thanks
    #  on post_comments.id = thanks.post_comment_id group by user_id order by sum_like_count limit 3;

    PostComment.left_joins(Thanks.count(:post_comment_id).group(:post_comment_id).select("post_comment_id, count(post_comment_id) as like_count")).group(:user_id).select("sum(thanks.like_count) as sum_like_count").order(:sum_like_count)
    @all_post_comments = PostComment.find(Thank.left_joins(:post_comment).group(:user_id).order('post_comment.id'))

    @q = Post.ransack(params[:q])
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").includes(:tags).order(created_at: :desc)
    elsif params[:q]
      @posts = @q.result.order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
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
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :text, :tag_list, :status)
  end
end
