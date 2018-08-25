class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :user_id, :integer
  	add_column :orders, :item_amount, :integer
  	add_column :orders, :cart_session_id, :string
  	remove_column :orders, :cart_id, :integer
  end
end
