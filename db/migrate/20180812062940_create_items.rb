class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

		t.text :item_image_id
		t.integer :artist_id
		t.integer :label_id
		t.integer :genre_id

		t.string :title	
		t.integer :price
		t.integer :stock
		t.integer :sales_quantity
		t.date :release_date
        t.timestamps

    end
  end
end
