class CreateCartItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_item_orders do |t|
    	t.integer :order_id
    	t.integer :cart_item_id

      t.timestamps
    end
  end
end
