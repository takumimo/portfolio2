class StocksController < ApplicationController

	def index
	  # ログインユーザーがストックした記事一覧を取得
	  @stock_posts = Stock.get_stock_posts(current_user)
  	end

  def create
    @post = Post.find(params[:post_id])
    # 取得した記事がまだストックされていなければ
    unless @post.stocked?(current_user)
      # ログインしているユーザーを取得してparamsで渡された記事をストック
      @post.stock(current_user)
    end
    redirect_to request.referrer
  end

  def destroy
    @post = Stock.find(params[:id]).post
    # 取得した記事が既にストックされていれば
    if @post.stocked?(current_user)
      @post.unstock(current_user)
    end
    redirect_to request.referrer
  end
end
