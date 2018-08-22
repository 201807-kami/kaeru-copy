class Admin::RecommendedItemsController < ApplicationController
	layout 'admin'

	
	include ItemsHelper
	
	def index
		@items = Item.all
	end

	def edit 
		@item = Item.find(params[:id])
	end

	def update
	    @item = Item.find(params[:id])
	    @item.update(item_params)
	    redirect_to admin_recommended_items_path
    end

    def destroy
    	@item = Item.find(params[:id])
    	@item.update(recommended: nil)
    	redirect_to admin_recommended_items_path
    end

    private

	def search_params
    	return  nil if params[:search].nil?
    	params.require(:search).permit(:genre_id, :title, :stock, :sort_type, :stock_type, statuses: [])
  	end

	def item_params
		params.require(:item).permit(
			:id, :title, :item_image,:image, :artist_id, :label_id, :genre_id, :price, :stock, :status, :recommended,
			discs_attributes: [:id, :disc_number, :_destroy,
				songs_attributes: [:id, :name, :_destroy]])
	end



end