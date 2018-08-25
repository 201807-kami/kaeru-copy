class Order < ApplicationRecord
	belongs_to :user
	has_many :order_histories
  accepts_nested_attributes_for :order_histories

	def set_attribute
    set_address
    build_order_history_from_cart
    set_amount
  end

  def set_address
    address = self.address
  end

  def build_order_history_from_cart
    self.order_histories = []
    Cart.includes(:item).search(self.user).each do |cart|
      self.order_histories.build(
          item_id: cart.item.id,
          price: cart.item.price,
          quantity: cart.quantity
      )
    end
  end

  def set_amount
    self.item_amount = 0
    self.order_histories.each do |order_history|
      self.item_amount += order_history.price * order_history.quantity
    end
  end

  def new_order
    set_amount
    set_current_item_info
    set_sales_quantity
    set_stock
    self.save!

    cart_clear
  end



  def set_current_item_info
    self.order_histories.each do |order_history|
      order_history.item_title = order_history.item.title
      order_history.price = order_history.item.price
    end
  end

  def set_sales_quantity
    self.order_histories.each do |order_history|
      order_history.item.increment!(:sales_quantity, 1 * order_history.quantity)
    end
  end

  def set_stock
    self.order_histories.each do |order_history|
      order_history.item.increment!(:stock, -1 * order_history.quantity)
    end
  end

  def cart_clear
    Cart.search(self.user).delete_all
  end


end
