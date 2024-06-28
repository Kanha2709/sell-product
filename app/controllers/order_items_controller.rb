class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      redirect_to @order_item.order, notice: 'Item added to order.'
    else
      render :new
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to @order_item.order, notice: 'Order item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, notice: 'Order item was successfully removed.'
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :quantity, :price)
  end
end
