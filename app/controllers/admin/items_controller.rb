class Admin::ItemsController < ApplicationController
	layout 'admin'

	include ItemsHelper
	
	def index
		@search_form = Admin::ItemSearchForm.new(search_params)
    @search_form.stock_type = :less if @search_form.stock_type.blank?
    @items = @search_form.search(params[:page])
    session['search_params'] = view_context.search_conditions_keeper(params, [:genre_id, :title])
	end

	def new
		@item = Item.new
		@item.discs.build
		@item.discs.first.songs.build
	end

	def create
		@item = Item.new(item_params)
		@artist = Artist.find_by(name: item_params[:artist_name])
		@item.artist_id = @artist.id
		@label = Label.find_by(name: item_params[:label_name])
		@item.label_id = @label.id
	  @item.save
		redirect_to admin_items_path
	end

	def edit 
		@item = Item.find(params[:id])
	end

	def update
    @item = Item.find(params[:id])
    @artist = Artist.find_by(name: item_params[:artist_name])
		@item.artist_id = @artist.id
    @item.update(item_params)
    redirect_to admin_items_path(session['search_params'])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = '削除が完了しました'
    redirect_to admin_items_path(session['search_params'])
  end


	private

	def search_params
    	return  nil if params[:search].nil?
    	params.require(:search).permit(:genre_id, :title, :stock, :sort_type, :stock_type, status: [])
  end

	def item_params
		params.require(:item).permit(
			:id, :title, :artist_name, :label_name, :item_image,:image, :label_id, :genre_id, :price, :stock, :status, :recommended,
			discs_attributes: [:id, :disc_number, :_destroy,
				songs_attributes: [:id, :name, :_destroy]])
	end
	



end