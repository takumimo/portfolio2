class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.post_comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path
    else
      render :edit
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
