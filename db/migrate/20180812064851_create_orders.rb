class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :cart_id
    	t.string :address
    	t.date :delivery_date
    	t.string :payment_method
    	t.integer :total_price
    	t.string :status, default: "受付中"


      t.timestamps
    end
  end
end
