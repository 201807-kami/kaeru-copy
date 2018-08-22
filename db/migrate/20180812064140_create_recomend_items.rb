class CreateRecomendItems < ActiveRecord::Migration[5.2]
  def change
    create_table :recomend_items do |t|

      t.integer :item_id

      t.integer :place_number

      t.timestamps
    end
  end
end
