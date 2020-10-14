class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
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

  private
  def user_params
  	params.require(:user).permit(:email, :name, :introduction)
  end
end







