class Admin::ArtistsController < ApplicationController
	layout 'admin'

	def index
		@search_form = Admin::ArtistSearchForm.new(search_params)
    @artists = @search_form.search(params[:page])
    session['search_params'] = view_context.search_conditions_keeper(params, [:name])
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to admin_artists_path
	end

	def edit 
		@artist = Artist.find(params[:id])
	end

	def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to admin_artists_path
  end

	def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:success] = '削除が完了しました'
    redirect_to admin_artists_path
  end

	private

	def search_params
    return  nil if params[:search].nil?
    params.require(:search).permit(:name)
  end

	def artist_params
		params.require(:artist).permit(:id, :name, :description, :artist_image)
	end
end