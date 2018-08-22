class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
    	t.integer :item_id
    	t.integer :cart_id
    	t.integer :quantity
    	t.references :item
    	t.references :cart

      t.timestamps
    end
  end
end
