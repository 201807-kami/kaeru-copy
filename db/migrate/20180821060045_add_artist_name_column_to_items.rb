class AddArtistNameColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :artist_name, :string
  end
end
