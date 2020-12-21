class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @comments = @user.post_comments.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_back(fallback_location: user_path(current_user), notice: "URLが有効ではありません")
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def followers
    @user = User.find(params[:id])
    @followers_users = User.find(params[:id]).followers
    @following_users = User.find(params[:id]).following
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :profile_image)
  end
end
