class LineItemsController < ApplicationController

  def create
    current_user.create_current_cart unless current_user.current_cart
    item = current_user.current_cart.add_item(params[:item_id])
    item.save
    redirect_to cart_path(current_user.current_cart)
  end

end
