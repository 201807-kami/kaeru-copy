class Cart < ApplicationRecord
	 belongs_to :user
	 belongs_to :item

	    

	def total_price
		cart_items.to_a.sum { |item| item.total_price }
  end

  def self.add_item(item_id, user)
    cart = Cart.find_or_initialize_by(user: user, item_id: item_id)
    cart.quantity += 1
    cart.save! && cart
  end

  def self.search(user)
    if user.present?
      Cart.where(user: user)
    else
      nil
    end
  end


end
