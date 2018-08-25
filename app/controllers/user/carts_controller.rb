class User::CartsController < ApplicationController
  
  before_action :find_cart, only: [:update, :destroy]

  def index
    @carts = current_user.carts
  end

  def create
    if Cart.add_item(params[:item_id], current_user)

      redirect_to user_carts_path(current_user)
    else
      flash[:error] = 'カートに商品を追加することができませんでした。'
      redirect_to user_item_path(id: params[:item_id])
    end
  end

  def update
    if @cart.update_quantity(params[:cart][:quantity].to_i)
      flash[:success] = "#{@cart.item.name} の数量を変更しました。"
    else
      flash[:error] = '数量を変更することができません。'
    end

    redirect_to carts_path
  end

  def destroy
    @cart.destroy!
    redirect_to action: :index
  end

  private


  def cart_session_id
    if session[:cart_session_id].blank?
      session[:cart_session_id] = SecureRandom.uuid
    end
    session[:cart_session_id]
  end

  def find_cart
    if user_signed_in?
      @cart = current_user.carts.find(params[:id])
    else
      @cart = Cart.find_by(user: nil, session_id: cart_session_id)
      raise ActiveRecord::RecordNotFound if @cart.nil?
    end
  end
end