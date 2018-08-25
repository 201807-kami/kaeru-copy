class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
    	t.integer :order_id
    	t.integer :item_id
    	t.string :item_title
    	t.integer :price
    	t.integer :quantity
    	

      t.timestamps
    end
  end
end
