class LineItemsController < ApplicationController

  def create
    if current_user && current_user.current_cart.nil? 
      current_user.current_cart = Cart.create(user_id: current_user.id, status: "not submitted")
     
     end
    item = Item.find(params[:item_id])
    line_item = current_cart.add_item(item.id)
    if line_item.save
      redirect_to cart_path(current_cart), notice: 'Item added to cart'
    else
      redirect_to store_path, notice: 'Unable to add Item'
    end
  end

end
