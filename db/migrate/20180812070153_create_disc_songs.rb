class CreateDiscSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_songs do |t|

      t.integer :disc_id
      t.integer :song_id
      t.timestamps
    end
  end
end
