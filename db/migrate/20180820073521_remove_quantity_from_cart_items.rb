class RemoveQuantityFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :quantity, :integer
  end
end
