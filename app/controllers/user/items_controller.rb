class User::ItemsController < ApplicationController
	def index
      @items = Item.search(params[:search])
	end
	def show
	  @item = Item.find(params[:id])
	end

	private

	def item_params
  		params.require(:item).permit(:cart_id, :item_image_id, :artist_id, :label_id, :genre_id, :price, :stock, :sales_quantity, :release_date,
       :title)
  	end
end
