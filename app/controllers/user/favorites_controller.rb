class User::FavoritesController < ApplicationController

	def index
    @user = current_user
    @favorite = Favorite.where(user_id: @user.id).all
	end


	#お気に入り登録用アクション
	def create
	    @item_id = Item.find(params[:id]).id #特定のitemのid
	    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
	    @favorite = Favorite.new(item_id: @item_id, user_id: current_user.id)
	    @favorite.save
	      #保存に成功した場合、一覧画面に戻る
	     redirect_to root_path
    end

    #お気に入り削除用アクション
    def destroy
    @favorite = Favorite.find(params[:id])
	    @favorite.destroy
	      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
	     redirect_to user_path(session[:id])
    end


end