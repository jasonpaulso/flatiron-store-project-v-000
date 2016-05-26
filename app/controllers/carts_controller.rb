class CartsController < ApplicationController

  def checkout
    cart = Cart.find(params[:id])
    cart.update(status: "submitted")
    cart.line_items.each {|item| item.sold}
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(cart)
  end
end
