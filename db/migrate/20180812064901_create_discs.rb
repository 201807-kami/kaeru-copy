class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|

      t.string :item_id
      t.string :disc_number
      t.timestamps
    end
  end
end
