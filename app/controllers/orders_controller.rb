class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    @order_details = @orders.each do |order|
      OrderDetail.where(order_id: order.id)
    end
  end

  def show; end
end
