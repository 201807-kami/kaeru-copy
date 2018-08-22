class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
	Cart.all.each do |cart|
		sums = cart.cart_items.group(:cart_id).sum(:quantity)

		sums.each do |cart_id, quantity|
			if quantity > 1
				cart.cart_items.where(cart_id: cart_id).delete_all
				cart.cart_items.create(cart_id: cart_id, quantity: quantity)
			end
		end
	end
  end

  def down
	CartItem.where("quantity>1").each do |cart_item|

		cart_item.quantity.times do
			CartItem.create cart_id: cart_item.cart_id, item_id: cart_item.item_id, quantity: 1
		end

		cart_item.destroy
	end
  end
end