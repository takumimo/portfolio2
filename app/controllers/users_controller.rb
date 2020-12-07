class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @comments = @user.post_comments.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def following
    @user = User.find(params[:id])
    @users = User.find(params[:id]).following
  end

  def followers
    @user = User.find(params[:id])
    @users = User.find(params[:id]).followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :profile_image)
  end
end
