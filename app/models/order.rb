class Order < ApplicationRecord
	belongs_to :user
	has_many :histories, class_name: 'OrderHistory'
  
  accepts_nested_attributes_for :histories

	def set_attribute
    set_address
    build_history_from_cart
    set_amount
  end

  def new_order(stripe_token = nil)
    set_amount
    set_current_item_info
    set_sales_quantity
    self.save!
    
    cart_clear
  end


	def set_address
  	address = self.address
  end

  def set_amount
    self.item_amount = 0
    self.histories.each do |history|
    	self.item_amount += history.item.price * history.quantity
    end
  end
  

  def build_history_from_cart
    
    Cart.includes(:item).search(self.user).each do |cart|
      self.histories.build(
          item_id: cart.item.id,
          quantity: cart.quantity
      )
    end
  end

  def set_current_item_info
    self.histories.each do |history|
      history.item_name = history.item.title
      history.price = history.item.price
    end
  end

  def set_sales_quantity
    self.histories.each do |history|
      self.history.item.sales_quantity += 1
    end
  end

  def cart_clear
    Cart.search(self.user).delete_all
  end


end
