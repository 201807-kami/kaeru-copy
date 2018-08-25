class AddDefaultToSalesQuantity < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :items, :sales_quantity, 0
  end
end
