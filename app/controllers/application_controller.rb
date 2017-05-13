class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def moltin
    @moltin ||= Moltin::Client.new({ storage: session })
  end

  def cart
    @cart ||= moltin.carts.get(cart_ref)
  end

  def cart_ref
    session[:cart_id] ||= SecureRandom.hex
  end
end
