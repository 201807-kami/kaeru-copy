class User::OrdersController < ApplicationController
 
  def new
    @order = current_user.orders.build
    @order.set_attribute
  end

  def create
    @order = current_user.orders.build
    @order.set_attribute
    @order.assign_attributes(post_params)
    @order.new_order
    session[:order] = nil
    redirect_to user_order_complete_path(@order)
  end

  def complete
    if params[:cart_session_id]
      @order = Order.find_by(cart_session_id: params[:cart_session_id])
      raise ActiveRecord::RecordNotFound if @order.nil?
    else
      @order = current_user.orders.find_by(id: params[:id])
    end
    render :complete
  end

  private
  def post_params
    params.require(:order).permit(
        :address, :delivery_date, :payment_method, :total_price, :user_id, :item_amount,
        order_histories_attributes: [:item_id, :quatity, :price]
    )
  end

end