class Cart < ApplicationRecord
	 belongs_to :user
	 belongs_to :item


  def self.add_item(item_id, user)
    cart = Cart.find_or_initialize_by(user: user, item_id: item_id)
    cart.quantity += 1
    cart.save! && cart
  end

  def update_quantity(quantity)
    self.quantity = quantity
    if self.item_error.present?
      false
    else
      self.save!
    end
  end


  def self.search(user)
    if user.present?
      Cart.where(user: user)
    else
      nil
    end
  end

  def self.current_quantity(user)
    Cart.search(user)&.sum(:quantity) || 0
  end

  def self.current_amount(user)
    amount = 0
    Cart.search(user)&.each do |cart|
      amount = amount + cart.item.price * cart.quantity
    end
    amount
  end


end
