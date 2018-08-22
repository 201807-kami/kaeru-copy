class User::ordersController < ApplicationController
	def new
    @cart = current_cart
      if @cart.cart_items.empty?
        redirect_to user_items_path, notice: 'カートは空です。'
      return
      end

    @order = Order.new

	end

 def create
    @order = Order.new(order_params)
    @order.add_items(current_cart)


      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to user_order(order.id) , notice: 'ご注文ありがとうございました。'
      end
    end
  end


private
  	def order_params
  		params.require(:order).permit(:adress, :payment_method)
 	  end

    def add_items(cart)
      cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
      end
  end