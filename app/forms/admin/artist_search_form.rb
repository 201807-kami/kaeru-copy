class Admin::ArtistSearchForm
  include ActiveModel::Model

  attr_accessor :name

  def search(page)
    artists = Artist.all
    #artists = artist.includes(:caption_image)
    artists = artists.where('`artists`.`name` like ?', "%#{name}%") 
    artists = artists.page(page).per(30)
  end
end