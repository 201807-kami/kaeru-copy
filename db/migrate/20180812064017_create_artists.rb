class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|

      t.string :name
      t.text :description

      t.text :artist_image_id

      t.timestamps
    end
  end
end
