class OrderItemsController < ApplicationController
  def new
  end


  def create
    @order = current_order
    @item = current_order.orderable.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to breakfast_menu_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
