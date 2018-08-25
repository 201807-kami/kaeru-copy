class AddQuantityToCarts < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :quantity, :integer, default: 0
  end
end
