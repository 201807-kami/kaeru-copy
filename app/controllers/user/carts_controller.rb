class User::CartsController < ApplicationController
	 before_action  only: [:update, :delete]


	def create
    @cart = Cart.find_by(user_id: current_user)
		item = Item.find(params[:id])
		#@cart_item = @cart.add_item(item.id)
		@cart_items = @cart.cart_items
    if CartItem.exists?(item_id: item.id)
      @cart_item = CartItem.where(item_id: item.id)
            binding.pry
      @cart_item.quantity += 1
      @cart_item.update
      redirect_to user_items_path, notice: 'カートに商品が追加されました。'
    else
      @cart_item = CartItem.new(cart_id: @cart.id,item_id: item.id, quantity: 1)
      if @cart_item.save
         redirect_to user_items_path, notice: 'カートに商品が追加されました。'
      else
         redirect_to user_item_path(item.id)
      end
    end
  end



  	def show
      	@cart = Cart.find(params[:id])
      	@cart_items = CartItem.where(cart_id: @cart.id)
  		#@carts = current_cart
  		#@item = item.find(params[:item_id])
		#@cart_item = @cart.cart_items.

    	# @cart_item.quantity += params[:quantity].to_i
    	@cart.cart_items.each do |cart_item|
    	@price += cart_item.item.price*cart_item.quantity
  	end

  	def update
   	 	#@cart_item.update(quantity: params[:quantity].to_i)
    	#redirect_to current_cart
  	end

  	def destroy
    	@cart = current_cart
   	 	@cart.destroy
    	session[:cart_id] = nil
      	redirect_to user_items_path, notice: 'カートが空になりました。'
    	end
  	end

 private

  	#def setup_cart_item!
   	 	#@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  	#end
 	def cart_params
  		params.require(:cart).permit(:cart_item_id, :user_id,)
  	end
end


