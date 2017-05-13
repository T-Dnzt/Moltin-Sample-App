class CartsController < ApplicationController
  def index
    @items = cart.items
  end

  def add
    cart.add(id: params[:product_id])
    redirect_to carts_path
  end

  def remove
    cart.remove(params[:cart_item_id])
    redirect_to carts_path
  end

  private

  def cart
    @cart ||= moltin.carts.get(cart_ref)
  end

  def cart_ref
    session[:cart_id] ||= SecureRandom.hex
  end
end
