class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      OrderMailer.with(order: @order).order_confirmation.deliver_later
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price, order_items_attributes: [:product_id, :quantity, :price])
  end
end
